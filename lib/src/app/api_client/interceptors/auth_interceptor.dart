import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';
import '../../router/router.dart';
import '../../shared_controllers/shared_controllers.dart';
import '../../storage/storage.dart';
import '../../tools/tools.dart';

class QueuedAuthInterceptor extends InterceptorsWrapper {
  late final _appLogger = AppLogger(where: '$this');
  final _localStorage = HiveStorage.instance;
  final Dio apiClient;

  final _requestsNeedRetry = <({
    RequestOptions options,
    ErrorInterceptorHandler handler,
  })>[];

  bool _isRefreshing = false;

  ///
  final String baseUrl;
  final AppRouter appRouter;

  QueuedAuthInterceptor({
    required this.baseUrl,
    required this.appRouter,
    required this.apiClient,
  });

  bool _shouldRefreshToken(DioException error) =>
      error.response?.statusCode == 401 || error.response?.statusCode == 307;

  bool _mustForceLogout(DioException error) =>
      error.response?.statusCode == 401 || error.response?.statusCode == 403;

  final _skipPaths = [
    '/api/v1/login/check_email/',
    '/api/v1/login/repass/',
    '/api/v1/login/recovery/',
    '/api/v1/login/auth/',
    '/api/v1/login/register/',
    '/api/v1/client/get_by_ref',
    '/api/v1/auth/refresh_token',
    '/api/v1/system/info/',
    '/api/v1/steps/countries/',
    '/api/v1/auth/id-token',
    '/api/v1/auth/access-token',
    '/api/v1/auth/logout',
  ];

  Future<void> _forceLogout({
    String? reason,
    DioException? error,
  }) async {
    _appLogger.logError(
      'Force logout reason: $reason',
      stackTrace: error?.stackTrace,
    );

    await _localStorage.deleteToken();

    final context = appRouter.navigatorKey.currentContext;

    if (context is BuildContext && context.mounted) {
      context.read<AuthorizationController>().signOut();
    } else {
      _appLogger.logError('context not found');
    }
  }

  Future<Either<DioException, TokenModel>> _refreshToken(
    TokenModel token,
    RequestOptions options,
  ) async {
    _appLogger.logError(
      'refresh token process begins with Refresh Token: ${token.refreshToken}',
    );

    try {
      final response = await apiClient.post(
        'auth/refresh_token',
        options: Options(
          headers: {
            "Authorization": 'Bearer ${token.refreshToken}',
          },
        ),
      );

      final freshToken = TokenModel.fromJson(
        response.data['token'],
      );

      _appLogger.logError(
        "new token:  ${await _localStorage.getToken()}",
      );

      return Right(freshToken);
    } on DioException catch (error) {
      return Left(error);
    }
  }

  ///
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final ignoreAuth = _skipPaths.contains(
      options.uri.path,
    );

    if (ignoreAuth) {
      return handler.next(options);
    }

    final token = await _localStorage.getToken();

    options.headers['Authorization'] = 'Bearer ${token?.accessToken}';

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    _appLogger.logMessage(
      'is refresing: $_isRefreshing',
    );

    final response = err.response;

    if (!_shouldRefreshToken(err)) {
      handler.next(err);
    } else if (err.requestOptions.path != "/api/v1/auth/refresh_token") {
      final token = await _localStorage.getToken();

      if (token is! TokenModel) {
        _appLogger.logMessage(
          'token not found: $token',
        );

        return await _forceLogout(
          reason: 'refresh token not found',
        );
      }

      if (!_isRefreshing) {
        _isRefreshing = true;

        _requestsNeedRetry.add(
          (
            options: response!.requestOptions,
            handler: handler,
          ),
        );

        final refreshingResponse = await _refreshToken(
          token,
          err.requestOptions,
        );

        refreshingResponse.fold(
          (error) async {
            _isRefreshing = false;
            _requestsNeedRetry.clear();

            if (_mustForceLogout(error)) {
              return await _forceLogout(
                reason: '_mustForceLogout',
              );
            }

            return handler.reject(error);
          },
          (token) async {
            await _localStorage.setToken(token);

            for (final requestNeedRetry in _requestsNeedRetry) {
              apiClient
                  .fetch(requestNeedRetry.options)
                  .then(requestNeedRetry.handler.resolve)
                  .catchError(
                    (resolveError) => _appLogger.logError(
                      'resolve error: $resolveError',
                    ),
                  );
            }

            _requestsNeedRetry.clear();
            _isRefreshing = false;
          },
        );
      }
    }
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) =>
      handler.next(response);
}

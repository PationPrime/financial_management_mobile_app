library src.app.modules.authentication.controller;

import 'package:financial_management/src/app/models/authentication/authentication.dart';
import 'package:financial_management/src/app/repositories/repositories.dart';
import 'package:financial_management/src/app/shared_controllers/authorization_controller/authorization_controller.dart';
import 'package:financial_management/src/app/storage/storage.dart';
import 'package:financial_management/src/app/tools/tools.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/core.dart';

part 'authentication_state.dart';

class AuthenticationController extends Cubit<AuthenticationState> {
  static const _logger = AppLogger(
    where: 'AuthenticationController',
  );

  final V1AuthenticationRepository _v1repository;
  final AuthorizationController _authorizationController;
  final StorageInterface _localStorage;

  AuthenticationController(
    this._v1repository,
    this._authorizationController,
    this._localStorage,
  ) : super(const AuthenticationInitialState());

  Future<void> login(
    LoginCredentials loginCredentials,
  ) async {
    emit(
      AuthenticationState.loading(),
    );

    final response = await _v1repository.login(loginCredentials);

    await Future.delayed(
      const Duration(seconds: 2),
    );

    response.fold(
      (failure) {
        _logger.logError(
          failure.message,
          code: failure.code,
          stackTrace: failure.stackTrace,
          lexicalScope: 'login()',
        );

        emit(
          state.copyWith(
            failure: failure,
          ),
        );
      },
      (token) async {
        _logger.logMessage(
          "$token",
        );

        await _localStorage.setToken(token);

        

        await _authorizationController.checkAuthState();
      },
    );

    emit(
      AuthenticationState.loading(false),
    );
  }
}

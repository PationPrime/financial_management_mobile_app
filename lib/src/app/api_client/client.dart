library src.api_client;

import 'package:dio/dio.dart';
import 'package:financial_management/src/app/api_client/base_client.dart';
import 'package:financial_management/src/app/config/environment/environment.dart';
import '../router/router.dart';
import 'interceptors/interceptors.dart';

part 'constants.dart';

final class ApiV1 extends ApiClient {
  ApiV1({
    required super.environment,
  }) : super(
          baseUrl: environment.v1RouteUrl,
        );
}

base class ConcreteApiClient {
  const ConcreteApiClient._();

  static const _instance = ConcreteApiClient._();

  factory ConcreteApiClient.singleton() => _instance;

  AppEnvironment get _environment => AppEnvironment.instance;

  ApiV1 get v1Instance => ApiV1(
        environment: _environment,
      );

  Dio get v1 => v1Instance.apiClient
    ..interceptors.add(
      QueuedAuthInterceptor(
        baseUrl: _environment.v1RouteUrl,
        appRouter: AppRouterProvider.instance,
        apiClient: v1Instance.apiClient,
      ),
    );
}

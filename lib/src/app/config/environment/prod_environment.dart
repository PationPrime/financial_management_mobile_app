part of 'environment.dart';

class ProdEnvironmet extends AppEnvironment {
  const ProdEnvironmet()
      : super._(
          v1RouteUrl: ProductionConfig.v1RouteUrl,
          baseUrl: ProductionConfig.baseUrl,
          connectTimeout: ProductionConfig.connectTimeout,
          receiveTimeout: ProductionConfig.receiveTimeout,
          defaultLocale: ProductionConfig.defaultLocale,
        );
}

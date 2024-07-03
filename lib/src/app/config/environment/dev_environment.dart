part of 'environment.dart';

class DevEnvironmet extends AppEnvironment {
const  DevEnvironmet()
      : super._(
          v1RouteUrl: DevelopConfig.v1RouteUrl,
          baseUrl: DevelopConfig.baseUrl,
          connectTimeout: DevelopConfig.connectTimeout,
          receiveTimeout: DevelopConfig.receiveTimeout,
          defaultLocale: DevelopConfig.defaultLocale,
        );
}

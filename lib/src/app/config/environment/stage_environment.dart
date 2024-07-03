part of 'environment.dart';

class StageEnvironmet extends AppEnvironment {
const   StageEnvironmet()
      : super._(
          v1RouteUrl: StagingConfig.v1RouteUrl,
          baseUrl: StagingConfig.baseUrl,
          connectTimeout: StagingConfig.connectTimeout,
          receiveTimeout: StagingConfig.receiveTimeout,
          defaultLocale: StagingConfig.defaultLocale,
        );
}

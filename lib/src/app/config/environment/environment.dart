library src.app.config.environment;

import 'package:financial_management/src/app/config/main_environment_config.dart';

import '../config.dart';

part 'dev_environment.dart';
part 'stage_environment.dart';
part 'prod_environment.dart';

abstract class AppEnvironment {
  static const _develop = "develop";
  static const _staging = "staging";
  static const _production = "production";

  final String baseUrl;
  final String v1RouteUrl;
  final int connectTimeout;
  final int receiveTimeout;
  final String defaultLocale;

  const AppEnvironment._({
    required this.baseUrl,
    required this.v1RouteUrl,
    required this.connectTimeout,
    required this.receiveTimeout,
    required this.defaultLocale,
  });

  @override
  String toString() =>
      "baseUrl: $baseUrl\nv1RouteUrl: $v1RouteUrl\nconnectTimeout: $connectTimeout\nreceiveTimeout:$receiveTimeout\ndefaultLocale: $defaultLocale";

  static AppEnvironment _instance =
      switch (MainEnvironmentConfig.currentConfigName) {
    _develop => const DevEnvironmet(),
    _staging => const StageEnvironmet(),
    _production => const ProdEnvironmet(),
    _ => const DevEnvironmet(),
  };

  static AppEnvironment get instance => _instance;

  static set instance(AppEnvironment env) {
    if (instance == env) return;
    _instance = env;
  }
}

extension AppEnvironmentState on AppEnvironment {
  bool get isDev => this is DevEnvironmet;
  bool get isStage => this is StageEnvironmet;
  bool get isProd => this is ProdEnvironmet;

  /// Checking that the main application env config is production env cofig.
  bool get mainIsProd =>
      MainEnvironmentConfig.currentConfigName == ProductionConfig.configName;
}

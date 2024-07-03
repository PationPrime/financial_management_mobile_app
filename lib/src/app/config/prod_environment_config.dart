class ProductionConfig {
  static const String configName = 'production';

  static const String baseUrl = 'https://prodhost:8081/';

  static const String v1RouteUrl = 'https://prodhost:8081/v1/';

  static const int connectTimeout = 30000;

  static const int receiveTimeout = 30000;

  static const String defaultLocale = 'ru_RU';
}

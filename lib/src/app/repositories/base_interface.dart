// ignore_for_file: unused_field

import 'package:financial_management/src/app/api_client/client.dart';
import 'package:flutter/foundation.dart';

import '../../../core/core.dart';

abstract interface class BaseRepositoryInterface {
  @protected
  ErrorHandler get errorHandler;

  @protected
  ConcreteApiClient get apiClient;
}

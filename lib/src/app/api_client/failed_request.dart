library src.app.api_client.failed_request;

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class FailedAPIRequest extends Equatable {
  final DioException error;
  final ErrorInterceptorHandler handler;

  const FailedAPIRequest(this.error, this.handler);

  FailedAPIRequest copyWith({
    DioException? error,
    ErrorInterceptorHandler? handler,
  }) =>
      FailedAPIRequest(
        error ?? this.error,
        handler ?? this.handler,
      );

  @override
  List<Object?> get props => [
        error,
        handler,
      ];
}

class APIRequest extends Equatable {
  final RequestOptions options;
  final RequestInterceptorHandler handler;

  const APIRequest(this.options, this.handler);

  APIRequest copyWith({
    RequestOptions? options,
    RequestInterceptorHandler? handler,
  }) =>
      APIRequest(
        options ?? this.options,
        handler ?? this.handler,
      );

  @override
  List<Object?> get props => [
        options,
        handler,
      ];
}
library core.errors.api_errors;

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../constants/constants.dart';
import '../../failure/failure.dart';

part 'error_handler.dart';

class ApiError extends Equatable {
  final String code;
  final String message;
  final Map<String, dynamic> rawBody;
  final StackTrace? stackTrace;

  const ApiError({
    required this.code,
    required this.message,
    this.rawBody = const <String, dynamic>{},
    this.stackTrace,
  });

  @override
  List<Object?> get props => [
        code,
        message,
        rawBody,
        stackTrace,
      ];

  ApiError copyWith({
    String? code,
    String? message,
    Map<String, dynamic>? rawBody,
    StackTrace? stackTrace,
  }) =>
      ApiError(
        code: code ?? this.code,
        message: message ?? this.message,
        rawBody: rawBody ?? this.rawBody,
        stackTrace: stackTrace ?? this.stackTrace,
      );
}

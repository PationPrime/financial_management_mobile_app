part of 'api_errors.dart';

final Map<int, Failure Function(ApiError)> _baseErrorCodes = {
  400: (ApiError apiError) => Code400Failure(
        stackTrace: apiError.stackTrace,
      ),
  404: (ApiError apiError) => Code404Failure(
        stackTrace: apiError.stackTrace,
      ),
  500: (ApiError apiError) => Code500Failure(
        stackTrace: apiError.stackTrace,
      ),
};

abstract class ErrorHandler {
  const ErrorHandler();

  Map<String, Failure Function(ApiError)> get errorCodeToFailure;

  Failure handleError(
    dynamic error, {
    StackTrace? stackTrace,
  }) {
    if (error is! DioException) {
      return OtherFailure(
        message: "$error",
        stackTrace: stackTrace,
      );
    }

    final extractedError = _extractError(
      error,
      stackTrace,
    );

    final failureBuilder = errorCodeToFailure[extractedError.code];

    return failureBuilder is Failure Function(ApiError)
        ? failureBuilder.call(extractedError)
        : handleUnhandledError(
            error,
            stackTrace,
          );
  }

  Failure handleUnhandledError(
    DioException error, [
    StackTrace? stackTrace,
  ]) {
    final extractedError = _extractError(
      error,
      stackTrace,
    );
    final failure =
        _baseErrorCodes[error.response?.statusCode]?.call(extractedError) ??
            OtherFailure(
              message: error.message ?? "DioException without message",
              stackTrace: stackTrace,
            );

    return failure;
  }

  ApiError _extractError(
    DioException error, [
    StackTrace? stackTrace,
  ]) {
    Map<String, dynamic> body = {};
    if (error.response?.data is Map) {
      body = error.response!.data;
    }

    return ApiError(
      code: body['code'] ?? '${error.response?.statusCode}',
      message: body['message'] ?? error.response?.data.toString() ?? '',
      rawBody: body,
      stackTrace: stackTrace,
    );
  }
}

part of 'authentication_errors.dart';

class AuthenticationErrorHandler extends ErrorHandler {
  const AuthenticationErrorHandler();

  @protected
  @override
  Map<String, Failure Function(ApiError)> get errorCodeToFailure => {
        "login_error": (ApiError apiError) => BadCredentialsFailure(
              code: apiError.code,
              message: apiError.message,
              stackTrace: apiError.stackTrace,
            ),
        "wrong_credentials": (ApiError apiError) => BadCredentialsFailure(
              code: apiError.code,
              message: apiError.message,
              stackTrace: apiError.stackTrace,
            ),
        "authentication_error": (ApiError apiError) => AuthenticationFailure(
              code: apiError.code,
              message: apiError.message,
              stackTrace: apiError.stackTrace,
            ),
        "token_expired": (ApiError apiError) => TokenExpiredFailure(
              code: apiError.code,
              message: apiError.message,
              stackTrace: apiError.stackTrace,
            ),
        "authorization_error": (ApiError apiError) => AuthorizationFailure(
              code: apiError.code,
              message: apiError.message,
              stackTrace: apiError.stackTrace,
            ),
        "failed_to_send_otp": (ApiError apiError) => OtpSendFailure(
              code: apiError.code,
              message: apiError.message,
              stackTrace: apiError.stackTrace,
            ),
        "daily_otp_limit_exceeded": (ApiError apiError) =>
            DailyOtpLimitExceededFailure(
              code: apiError.code,
              message: apiError.message,
              stackTrace: apiError.stackTrace,
            ),
        "too_many_otp_requests": (ApiError apiError) =>
            TooManyOtpRequestsFailure(
              code: apiError.code,
              message: apiError.message,
              stackTrace: apiError.stackTrace,
            ),
        "too_many_otp_verification_attempts_per_code": (ApiError apiError) =>
            TooManyOtpVerificationAttemptsFailure(
              code: apiError.code,
              message: apiError.message,
              stackTrace: apiError.stackTrace,
            ),
        "invalid_otp_code": (ApiError apiError) => InvalidOtpFailure(
              code: apiError.code,
              message: apiError.message,
              stackTrace: apiError.stackTrace,
            ),
        "expired_otp_code": (ApiError apiError) => ExpiredOtpFailure(
              code: apiError.code,
              message: apiError.message,
              stackTrace: apiError.stackTrace,
            ),
        "other_error": (ApiError apiError) => OtherFailure(
              message: apiError.message,
              stackTrace: apiError.stackTrace,
            ),
      };
}

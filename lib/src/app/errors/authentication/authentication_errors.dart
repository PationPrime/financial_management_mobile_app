library src.app.errors.authentication;

import 'package:flutter/cupertino.dart';

import '../../../../core/core.dart';

part 'authentication_error_handler.dart';

class LoginFailure extends Failure {
  const LoginFailure({
    super.code,
    super.message = 'Internal error',
    super.stackTrace,
  });
}

class BadCredentialsFailure extends Failure {
  const BadCredentialsFailure({
    super.code,
    super.message = 'Invalid credentials',
    super.stackTrace,
  });
}

class AuthenticationFailure extends Failure {
  const AuthenticationFailure({
    super.code,
    super.message = 'Authentication error',
    super.stackTrace,
  });
}

class TokenExpiredFailure extends Failure {
  const TokenExpiredFailure({
    super.code,
    super.message = 'Authentication error',
    super.stackTrace,
  });
}

class AuthorizationFailure extends Failure {
  const AuthorizationFailure({
    super.code,
    super.message = 'Authentication error',
    super.stackTrace,
  });
}

class OtpSendFailure extends Failure {
  const OtpSendFailure({
    super.code,
    super.message = 'Error sending code',
    super.stackTrace,
  });
}

class DailyOtpLimitExceededFailure extends Failure {
  const DailyOtpLimitExceededFailure({
    super.code,
    super.message = 'Error sending code',
    super.stackTrace,
  });
}

class TooManyOtpRequestsFailure extends Failure {
  const TooManyOtpRequestsFailure({
    super.code,
    super.message = 'Too many code requests',
    super.stackTrace,
  });
}

class TooManyOtpVerificationAttemptsFailure extends Failure {
  const TooManyOtpVerificationAttemptsFailure({
    super.code,
    super.message = 'Code requests exceeded',
    super.stackTrace,
  });
}

class InvalidOtpFailure extends Failure {
  const InvalidOtpFailure({
    super.code,
    super.message = 'Invalid code',
    super.stackTrace,
  });
}

class ExpiredOtpFailure extends Failure {
  const ExpiredOtpFailure({
    super.code,
    super.message = 'Code expired',
    super.stackTrace,
  });
}

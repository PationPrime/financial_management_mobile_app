library core.constants.failure;

import '../failure/failure.dart';

class OtherFailure extends Failure {
  final String errorCode;

  const OtherFailure({
    this.errorCode = 'other_error',
    super.message = 'Something went wrong',
    super.stackTrace,
  });
}

class Code400Failure extends Failure {
  final String errorCode;

  const Code400Failure({
    this.errorCode = 'bad_request',
    super.message = 'Bad request',
    super.stackTrace,
  });
}

class Code404Failure extends Failure {
  final String errorCode;

  const Code404Failure({
    this.errorCode = 'not_found',
    super.message = 'Not found',
    super.stackTrace,
  });
}

class Code500Failure extends Failure {
  final String? errorCode;

  const Code500Failure({
    this.errorCode = 'server_error',
    super.message = 'Internal error',
    super.stackTrace,
  });
}

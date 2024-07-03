library core.failure;

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable implements Exception {
  final String title;
  final String? code;
  final String message;
  final StackTrace? stackTrace;

  const Failure({
    this.title = "Error",
    this.code,
    this.message = "Something went wrong",
    this.stackTrace,
  });

  @override
  List<Object?> get props => [
        title,
        code,
        message,
        stackTrace,
      ];
}

class UnknownFailure extends Failure {
  const UnknownFailure({
    super.message = "Unknown error",
  });
}

part of 'validation.dart';

class ValidationError extends Equatable {
  final String? code;
  final String message;

  const ValidationError({
    this.code,
    required this.message,
  });

  const ValidationError.empty({
    this.code,
    this.message = "",
  });

  @override
  List<Object?> get props => [
        code,
        message,
      ];

  ValidationError copyWith({
    String? code,
    String? message,
  }) =>
      ValidationError(
        code: code ?? this.code,
        message: message ?? this.message,
      );
}

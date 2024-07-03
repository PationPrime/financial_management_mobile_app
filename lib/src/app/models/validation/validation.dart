library src.app.models.validation;

import 'package:equatable/equatable.dart';

export 'text_field_validation.dart';

part 'validation_error.dart';

abstract class Validation extends Equatable {
  final bool isValid;
  final List<ValidationError> errors;

  const Validation({
    this.isValid = true,
    this.errors = const [],
  });

  @override
  List<Object?> get props => [
        isValid,
        errors,
      ];

  Validation copyWith({
    bool? isValid,
    List<ValidationError>? errors,
  }) ;
}

library src.app.models.validation.form;

import 'package:equatable/equatable.dart';

import 'validation.dart';

class FormValidation extends Equatable {
  final List<Validation> validations;

  bool get isValid => validations.every(
        (validaion) => validaion.isValid,
      );

  const FormValidation({
    this.validations = const [],
  });

  @override
  List<Object?> get props => [
        validations,
      ];

  FormValidation copyWith({
    List<Validation>? validations,
  }) =>
      FormValidation(
        validations: validations ?? this.validations,
      );
}

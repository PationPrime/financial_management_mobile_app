library src.app.models.validation.text_field;

import 'package:financial_management/src/app/models/validation/validation.dart';

class TextFieldValidation extends Validation {
  const TextFieldValidation({
    super.isValid,
    super.errors,
  });

  @override
  TextFieldValidation copyWith({
    bool? isValid,
    List<ValidationError>? errors,
  }) =>
      TextFieldValidation(
        isValid: isValid ?? this.isValid,
        errors: errors ?? this.errors,
      );
}

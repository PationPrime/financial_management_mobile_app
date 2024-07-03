library src.app.constants.regexp;

abstract base class RegExpConstants {
  static final emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}",
  );

  static final digitsRegExp = RegExp(
    r'^(?=.*?[0-9])',
  );

  static final eightCharsRegExp = RegExp(
    r'^.{8,}',
  );

  static final upperCaseRegExp = RegExp(
    r'^(?=.*[A-Z])',
  );

  static final lowerCaseRegExp = RegExp(
    r'^(?=.*[a-z])',
  );

  static final specialCharRegExp = RegExp(
    r"^(?=.*?[`‘'\/\/!;:_\-=+%^@#\$&*~])",
  );
}

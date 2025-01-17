// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en_US = {
  "app": {
    "title": "FMan",
    "auth": {
      "login": {
        "title": "Login",
        "input": {
          "hint": {
            "email": "email",
            "password": "password"
          },
          "validation": {
            "email": {
              "invalid": "Invalid email address"
            },
            "password": {
              "empty": "Invalid password"
            }
          }
        },
        "dont_have_an_account": "Don't have an account?",
        "button": {
          "forgot_password": "Forgot password?",
          "login": "Login",
          "sign_up": "Sign up"
        }
      },
      "sign_up": {
        "title": "Sign Up",
        "input": {
          "hint": {
            "email": "email",
            "firstname": "firstname",
            "lastname": "lastname",
            "password": "password",
            "repeat_password": "repeat password"
          },
          "validation": {
            "email": {
              "empty": "Email cannot be empty",
              "invalid": "Invalid email address"
            },
            "firstname": {
              "empty": "First name cannot be empty",
              "contains_digits": "First name cannot contains digits"
            },
            "lastname": {
              "empty": "Last name cannot be empty",
              "contains_digits": "Last name cannot contains digits"
            },
            "password": {
              "empty": "Passord cannot be empty",
              "invalid": "Invalid password",
              "at_least_one_digit": "Must contain at least one digit",
              "at_least_one_capital_letter": "Must contain at least one capital letter",
              "at_least_one_lowercase_letter": "Must contain at least one lowercase letter",
              "at_least_eight_characters": "Length must be at least 8 characters",
              "at_least_one_special_character": "Must contain at least one special character",
              "do_not_match": "Passwords do not match"
            }
          }
        },
        "agree_to_all": "I agree to all the",
        "button": {
          "terms_and_conditions": "Terms & Conditions",
          "get_code": "Get code"
        }
      },
      "email_confirmaion": {
        "title": "Email confirmation",
        "description": "We have sent a 6-digit confirmation code to the email you provided.",
        "button": {
          "resend_code": "Resend code"
        }
      },
      "recover_password": {
        "title": "Recover password",
        "description": "To recover your password, we need to verify your identity. Please enter the email associated with your account and we will send you a verification code",
        "input": {
          "hint": {
            "email": "email"
          }
        },
        "button": {
          "send": "Send"
        }
      }
    },
    "env_settings": {
      "title": "Config settings",
      "subtitle": "Environment config settings"
    }
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": en_US};
}

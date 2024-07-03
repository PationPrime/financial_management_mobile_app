library src.app.models.authentication.credentials.login;

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_credentials.g.dart';

@JsonSerializable()
class LoginCredentials extends Equatable {
  final String email;
  final String password;

  const LoginCredentials({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];

  factory LoginCredentials.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$LoginCredentialsFromJson(json);

  Map<String, dynamic> toJson() => _$LoginCredentialsToJson(this);
}

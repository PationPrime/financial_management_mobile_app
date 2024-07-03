library src.app.repositories.authentication;

import 'package:financial_management/src/app/api_client/client.dart';
import 'package:financial_management/src/app/models/models.dart';
import 'package:financial_management/src/app/repositories/base_interface.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../errors/authentication/authentication_errors.dart';

part 'v1_authentication.dart';

abstract interface class AuthenticationRepositoryInterface
    implements BaseRepositoryInterface {
  ///
  Future<void> getEmailConfirmationCode();

  Future<void> confirmEmail(
    String code,
  );

  Future<Either<Failure, TokenModel>> login(
    LoginCredentials loginCredentials,
  );
}

part of 'authentication_interface.dart';

class V1AuthenticationRepository implements AuthenticationRepositoryInterface {
  final ConcreteApiClient _apiClient;

  const V1AuthenticationRepository(
    this._apiClient,
  );

  @override
  ConcreteApiClient get apiClient => _apiClient;

  @override
  ErrorHandler get errorHandler => const AuthenticationErrorHandler();

  @override
  Future<void> confirmEmail(String code) async {}

  @override
  Future<void> getEmailConfirmationCode() async {}

  @override
  Future<Either<Failure, TokenModel>> login(
    LoginCredentials loginCredentials,
  ) async {
    try {
      final response = await apiClient.v1.post(
        'auth/login',
        data: loginCredentials.toJson(),
      );

      log("${response.data}");

      return Right(
        TokenModel.fromJson(response.data['token']),
      );
    } catch (error, stackTrace) {
      return Left(
        errorHandler.handleError(
          error,
          stackTrace: stackTrace,
        ),
      );
    }
  }
}

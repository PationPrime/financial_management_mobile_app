import 'package:financial_management/core/errors/api/api_errors.dart';
import 'package:financial_management/src/app/api_client/client.dart';
import 'package:financial_management/src/app/repositories/test_repo/test_repo_interface.dart';

base class TestRepo implements TestRepoInterface {
  final ConcreteApiClient _client;

  const TestRepo(this._client);

  @override
  ConcreteApiClient get apiClient => _client;

  ///
  @override
  ErrorHandler get errorHandler => throw UnimplementedError();

  @override
  Future<void> testCallUserMe() async {
    try {
      final response = await apiClient.v1.get('user/me');

      print('test call user me: ${response.data}');
    } catch (error, stackTrace) {
      ///
      print(
        'error: $error, stackTrace: $stackTrace',
      );
    }
  }

  @override
  Future<void> testCallUserYou() async {
    try {
      final response = await apiClient.v1.get('user/you');

      print('test call user you: ${response.data}');
    } catch (error, stackTrace) {
      ///
      print(
        'error: $error, stackTrace: $stackTrace',
      );
    }
  }
}

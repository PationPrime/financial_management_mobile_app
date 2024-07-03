import '../base_interface.dart';

abstract interface class TestRepoInterface implements BaseRepositoryInterface {
  Future<void> testCallUserMe();
  Future<void> testCallUserYou();
}

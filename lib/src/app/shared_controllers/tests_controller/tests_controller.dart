import 'package:financial_management/src/app/repositories/test_repo/test_repo_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'tests_state.dart';

class TestsController extends Cubit<TestsState> {
  final TestRepoInterface _repoInterface;

  TestsController(
    this._repoInterface,
  ) : super(TestsInitialState());

  Future<void> testCallUserMe() async {
    final response = await _repoInterface.testCallUserMe();
  }

  Future<void> testCallUserYou() async {
    final response = await _repoInterface.testCallUserYou();
  }
}

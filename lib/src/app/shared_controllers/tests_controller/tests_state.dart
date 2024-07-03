part of 'tests_controller.dart';

sealed class TestsState extends Equatable {
  const TestsState();

  @override
  List<Object> get props => [];
}

final class TestsInitialState extends TestsState {}

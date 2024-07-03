part of 'authentication_controller.dart';

class AuthenticationState extends Equatable {
  final bool loading;
  final Failure? failure;

  const AuthenticationState({
    this.loading = false,
    this.failure,
  });

  @override
  List<Object?> get props => [
        loading,
        failure,
      ];

  factory AuthenticationState.loading([
    bool value = true,
  ]) =>
      AuthenticationState(
        loading: value,
      );

  AuthenticationState copyWith({
    bool? loading,
    Failure? failure,
  }) =>
      AuthenticationState(
        loading: loading ?? this.loading,
        failure: failure,
      );

  AuthenticationState clearFailure() => AuthenticationState(
        loading: loading,
      );
}

final class AuthenticationInitialState extends AuthenticationState {
  const AuthenticationInitialState();
}

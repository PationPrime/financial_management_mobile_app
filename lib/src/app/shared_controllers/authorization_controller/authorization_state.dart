part of 'authorization_controller.dart';

sealed class AuthorizationState extends Equatable {
  const AuthorizationState();

  @override
  List<Object> get props => [];
}

final class InitialState extends AuthorizationState {
  const InitialState();
}

final class Authorized extends AuthorizationState {
  const Authorized();
}

final class Unauthorized extends AuthorizationState {
  const Unauthorized();
}

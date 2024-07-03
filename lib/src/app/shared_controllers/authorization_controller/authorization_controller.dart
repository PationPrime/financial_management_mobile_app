library src.app.shared_controllers.authorization_controller;

import 'dart:async';

import 'package:financial_management/src/app/models/authentication/token/token.dart';
import 'package:financial_management/src/app/storage/storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'authorization_state.dart';

class AuthorizationController extends Cubit<AuthorizationState> {
  final StorageInterface _localStorage;

  AuthorizationController(
    this._localStorage,
  ) : super(
          const InitialState(),
        ) {
    checkAuthState();
  }

  Future<void> checkAuthState() async {
    final token = await _localStorage.getToken();

    emit(
      token is TokenModel ? const Authorized() : const Unauthorized(),
    );
  }

  Future<void> signOut() async {
    emit(const Unauthorized());
  }
}

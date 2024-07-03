library src.app.storage;

import 'dart:async';
import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

import '../models/models.dart';

part 'hive_storage.dart';

abstract interface class StorageInterface {
  const StorageInterface();

  Future<void> setToken(TokenModel token);
  Future<TokenModel?> getToken();
  FutureOr<void> deleteToken();
}

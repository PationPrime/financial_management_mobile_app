part of 'storage.dart';

final class HiveStorage implements StorageInterface {
  const HiveStorage._();

  static const instance = HiveStorage._();

  @override
  Future<void> setToken(TokenModel token) async {
    final authHiveBox = await Hive.openBox('auth');
    await authHiveBox.put('token', token);
  }

  @override
  Future<TokenModel?> getToken() async {
    final authHiveBox = await Hive.openBox('auth');
    final token = authHiveBox.get('token');
    return token;
  }

  @override
  FutureOr<void> deleteToken() async {
    final authHiveBox = await Hive.openBox('auth');
    await authHiveBox.delete('token');
  }
}

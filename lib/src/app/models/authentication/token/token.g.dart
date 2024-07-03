// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TokenModelAdapter extends TypeAdapter<TokenModel> {
  @override
  final int typeId = 0;

  @override
  TokenModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TokenModel(
      accessToken: fields[0] as String,
      refreshToken: fields[1] as String,
      accessTokenTtl: fields[2] as int,
      refreshTokenTtl: fields[3] as int,
      roles: (fields[4] as List?)?.cast<String>(),
      dateTime: fields[5] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, TokenModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.accessToken)
      ..writeByte(1)
      ..write(obj.refreshToken)
      ..writeByte(2)
      ..write(obj.accessTokenTtl)
      ..writeByte(3)
      ..write(obj.refreshTokenTtl)
      ..writeByte(4)
      ..write(obj.roles)
      ..writeByte(5)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TokenModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => TokenModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      accessTokenTtl: (json['accessTokenTtl'] as num).toInt(),
      refreshTokenTtl: (json['refreshTokenTtl'] as num).toInt(),
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$TokenModelToJson(TokenModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'accessTokenTtl': instance.accessTokenTtl,
      'refreshTokenTtl': instance.refreshTokenTtl,
      'roles': instance.roles,
      'dateTime': instance.dateTime?.toIso8601String(),
    };

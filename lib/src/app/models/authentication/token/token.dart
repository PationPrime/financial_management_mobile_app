library src.app.models.authentication.token;

import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class TokenModel extends Equatable {
  @HiveField(0)
  final String accessToken;

  @HiveField(1)
  final String refreshToken;

  @HiveField(2)
  final int accessTokenTtl;

  @HiveField(3)
  final int refreshTokenTtl;

  @HiveField(4)
  final List<String>? roles;

  @HiveField(5)
  final DateTime? dateTime;

  bool get isAccessTokenAlive =>
      dateTime!.difference(DateTime.now()).inSeconds.abs() <
      (accessTokenTtl - accessTokenTtl / 20);

  bool get isRefreshTokenAlive =>
      dateTime!.difference(DateTime.now()).inSeconds.abs() <
      (refreshTokenTtl - refreshTokenTtl / 20);

  const TokenModel({
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenTtl,
    required this.refreshTokenTtl,
    this.roles,
    required this.dateTime,
  });

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
        accessTokenTtl,
        refreshTokenTtl,
        roles,
        dateTime,
      ];

  TokenModel copyWith({
    String? accessToken,
    String? refreshToken,
    DateTime? dateTime,
    int? accessTokenTtl,
    int? refreshTokenTtl,
    List<String>? roles,
  }) =>
      TokenModel(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
        accessTokenTtl:
            accessTokenTtl ?? this.accessTokenTtl,
        refreshTokenTtl:
            refreshTokenTtl ?? this.refreshTokenTtl,
        roles: roles ?? this.roles,
        dateTime: dateTime ?? this.dateTime,
      );

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}

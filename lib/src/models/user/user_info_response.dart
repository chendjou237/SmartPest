import 'package:json_annotation/json_annotation.dart';

part 'user_info_response.g.dart';

@JsonSerializable()
class UserInfoResponse {
  final String? avatar;
  final String? birth;
  final String? email;
  final Extral? extral;
  final String? fullName;
  final String? gender;
  final String? id;
  final String? note;
  final String? phone;
  final Role? role;
  final String? scopeId;
  final String? username;

  UserInfoResponse({
    this.avatar,
    this.birth,
    this.email,
    this.extral,
    this.fullName,
    this.gender,
    this.id,
    this.note,
    this.phone,
    this.role,
    this.scopeId,
    this.username,
  });

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$UserInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoResponseToJson(this);
}

@JsonSerializable()
class Role {
  final String createTime;
  final String id;
  final String name;
  final String note;
  final List<String> permissions;
  final int priority;
  final String scopeId;

  Role({
    required this.createTime,
    required this.id,
    required this.name,
    required this.note,
    required this.permissions,
    required this.priority,
    required this.scopeId,
  });

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
  Map<String, dynamic> toJson() => _$RoleToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Extral {
  final LastLogin lastLogin;

  Extral({
    required this.lastLogin,
  });

  factory Extral.fromJson(Map<String, dynamic> json) => _$ExtralFromJson(json);
  Map<String, dynamic> toJson() => _$ExtralToJson(this);
}

@JsonSerializable()
class LastLogin {
  final String place;
  final String time;

  LastLogin({
    required this.place,
    required this.time,
  });

  factory LastLogin.fromJson(Map<String, dynamic> json) =>
      _$LastLoginFromJson(json);
  Map<String, dynamic> toJson() => _$LastLoginToJson(this);
}

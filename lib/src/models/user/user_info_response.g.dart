// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoResponse _$UserInfoResponseFromJson(Map<String, dynamic> json) =>
    UserInfoResponse(
      avatar: json['avatar'] as String?,
      birth: json['birth'] as String?,
      email: json['email'] as String?,
      extral: json['extral'] == null
          ? null
          : Extral.fromJson(json['extral'] as Map<String, dynamic>),
      fullName: json['fullName'] as String?,
      gender: json['gender'] as String?,
      id: json['id'] as String?,
      note: json['note'] as String?,
      phone: json['phone'] as String?,
      role: json['role'] == null
          ? null
          : Role.fromJson(json['role'] as Map<String, dynamic>),
      scopeId: json['scopeId'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$UserInfoResponseToJson(UserInfoResponse instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'birth': instance.birth,
      'email': instance.email,
      'extral': instance.extral,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'id': instance.id,
      'note': instance.note,
      'phone': instance.phone,
      'role': instance.role,
      'scopeId': instance.scopeId,
      'username': instance.username,
    };

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
      createTime: json['createTime'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      note: json['note'] as String,
      permissions: (json['permissions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      priority: (json['priority'] as num).toInt(),
      scopeId: json['scopeId'] as String,
    );

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'createTime': instance.createTime,
      'id': instance.id,
      'name': instance.name,
      'note': instance.note,
      'permissions': instance.permissions,
      'priority': instance.priority,
      'scopeId': instance.scopeId,
    };

Extral _$ExtralFromJson(Map<String, dynamic> json) => Extral(
      lastLogin: LastLogin.fromJson(json['lastLogin'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExtralToJson(Extral instance) => <String, dynamic>{
      'lastLogin': instance.lastLogin.toJson(),
    };

LastLogin _$LastLoginFromJson(Map<String, dynamic> json) => LastLogin(
      place: json['place'] as String,
      time: json['time'] as String,
    );

Map<String, dynamic> _$LastLoginToJson(LastLogin instance) => <String, dynamic>{
      'place': instance.place,
      'time': instance.time,
    };

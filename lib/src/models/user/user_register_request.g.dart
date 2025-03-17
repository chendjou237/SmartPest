// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegisterRequest _$UserRegisterRequestFromJson(Map<String, dynamic> json) =>
    UserRegisterRequest(
      userName: json['username'] as String,
      email: json['email'] as String,
      mobileNumber: json['phone'] as String,
      password: json['password'] as String,
      confirmPassword: json['repeatPassword'] as String,
      fullName: json['fullName'] as String,
      note: json['note'] as String? ?? '',
      birth: json['birth'] as String? ?? '',
    );

Map<String, dynamic> _$UserRegisterRequestToJson(
        UserRegisterRequest instance) =>
    <String, dynamic>{
      'username': instance.userName,
      'fullName': instance.fullName,
      'email': instance.email,
      'phone': instance.mobileNumber,
      'password': instance.password,
      'repeatPassword': instance.confirmPassword,
      'note': instance.note,
      'birth': instance.birth,
    };

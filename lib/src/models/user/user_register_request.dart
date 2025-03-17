import 'package:json_annotation/json_annotation.dart';

part 'user_register_request.g.dart';

@JsonSerializable()
class UserRegisterRequest {
  @JsonKey(name: 'username')
  final String userName;
  @JsonKey(name: 'fullName')
  final String fullName;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'phone')
  final String mobileNumber;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'repeatPassword')
  final String confirmPassword;
  final String note;
  final String birth;

  UserRegisterRequest({
    required this.userName,
    required this.email,
    required this.mobileNumber,
    required this.password,
    required this.confirmPassword,
    required this.fullName,
    this.note = '',
    this.birth = '',
  });

  factory UserRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UserRegisterRequestToJson(this);
}

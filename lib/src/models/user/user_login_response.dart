import 'package:json_annotation/json_annotation.dart';

part 'user_login_response.g.dart';

@JsonSerializable()
class UserLoginResponse {
  String? accessToken;
  String? refreshToken;

  UserLoginResponse({this.accessToken, this.refreshToken});

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$UserLoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginResponseToJson(this);
}

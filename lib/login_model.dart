import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  bool? status;
  bool? user;
  String? message;
  String? accessToken;
  String? refreshToken;

  Login({
    this.status,
    this.user,
    this.message,
    this.accessToken,
    this.refreshToken,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    status: json["status"],
    user: json["user"],
    message: json["message"],
    accessToken: json["access_token"],
    refreshToken: json["refresh_token"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "user": user,
    "message": message,
    "access_token": accessToken,
    "refresh_token": refreshToken,
  };
}

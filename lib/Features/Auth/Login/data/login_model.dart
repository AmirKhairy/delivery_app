class LoginModel {
  String? accessToken;
  String? refreshToken;
  String? tokenType;
  int? userId;
  String? email;

  LoginModel({
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.userId,
    this.email,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    accessToken: json['access_token'] as String?,
    refreshToken: json['refresh_token'] as String?,
    tokenType: json['token_type'] as String?,
    userId: json['user_id'] as int?,
    email: json['email'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'access_token': accessToken,
    'refresh_token': refreshToken,
    'token_type': tokenType,
    'user_id': userId,
    'email': email,
  };
}

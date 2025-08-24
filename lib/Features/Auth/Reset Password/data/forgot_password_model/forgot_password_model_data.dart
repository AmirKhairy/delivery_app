class ForgotPasswordModelData {
  String? email;

  ForgotPasswordModelData({this.email});

  factory ForgotPasswordModelData.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordModelData(email: json['email'] as String?);

  Map<String, dynamic> toJson() => {'email': email};
}

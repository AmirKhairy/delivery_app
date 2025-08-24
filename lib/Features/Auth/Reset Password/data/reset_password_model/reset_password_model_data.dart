class ResetPasswordModelData {
  String? email;

  ResetPasswordModelData({this.email});

  factory ResetPasswordModelData.fromJson(Map<String, dynamic> json) =>
      ResetPasswordModelData(email: json['email'] as String?);

  Map<String, dynamic> toJson() => {'email': email};
}

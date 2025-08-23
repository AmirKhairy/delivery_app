class SignUpModelData {
  String? email;

  SignUpModelData({this.email});

  factory SignUpModelData.fromJson(Map<String, dynamic> json) =>
      SignUpModelData(email: json['email'] as String?);

  Map<String, dynamic> toJson() => {'email': email};
}

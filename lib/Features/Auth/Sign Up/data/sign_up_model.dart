class SignUpModel {
  String? message;

  SignUpModel({this.message});

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      SignUpModel(message: json['Message'] as String?);

  Map<String, dynamic> toJson() => {'Message': message};
}

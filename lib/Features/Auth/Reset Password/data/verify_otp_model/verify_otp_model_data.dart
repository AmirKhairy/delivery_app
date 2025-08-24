class VerifyOtpModelData {
  String? resetToken;

  VerifyOtpModelData({this.resetToken});

  factory VerifyOtpModelData.fromJson(Map<String, dynamic> json) =>
      VerifyOtpModelData(resetToken: json['reset_token'] as String?);

  Map<String, dynamic> toJson() => {'reset_token': resetToken};
}

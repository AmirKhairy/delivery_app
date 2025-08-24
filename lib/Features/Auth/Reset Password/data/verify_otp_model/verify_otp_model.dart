import 'verify_otp_model_data.dart';

class VerifyOtpModel {
  int? ret;
  VerifyOtpModelData? data;
  String? msg;

  VerifyOtpModel({this.ret, this.data, this.msg});

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    return VerifyOtpModel(
      ret: json['ret'] as int?,
      data: json['data'] == null
          ? null
          : VerifyOtpModelData.fromJson(json['data'] as Map<String, dynamic>),
      msg: json['msg'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'ret': ret,
    'data': data?.toJson(),
    'msg': msg,
  };
}

import 'forgot_password_model_data.dart';

class ForgotPasswordModel {
  int? ret;
  ForgotPasswordModelData? data;
  String? msg;

  ForgotPasswordModel({this.ret, this.data, this.msg});

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordModel(
      ret: json['ret'] as int?,
      data: json['data'] == null
          ? null
          : ForgotPasswordModelData.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
      msg: json['msg'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'ret': ret,
    'data': data?.toJson(),
    'msg': msg,
  };
}

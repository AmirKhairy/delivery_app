import 'reset_password_model_data.dart';

class ResetPasswordModel {
  int? ret;
  ResetPasswordModelData? data;
  String? msg;

  ResetPasswordModel({this.ret, this.data, this.msg});

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordModel(
      ret: json['ret'] as int?,
      data: json['data'] == null
          ? null
          : ResetPasswordModelData.fromJson(json['data'] as Map<String, dynamic>),
      msg: json['msg'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'ret': ret,
    'data': data?.toJson(),
    'msg': msg,
  };
}

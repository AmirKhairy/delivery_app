import 'login_model_data.dart';

class LoginModel {
  int? ret;
  LoginModelData? data;
  String? msg;

  LoginModel({this.ret, this.data, this.msg});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    ret: json['ret'] as int?,
    data: json['data'] == null
        ? null
        : LoginModelData.fromJson(json['data'] as Map<String, dynamic>),
    msg: json['msg'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'ret': ret,
    'data': data?.toJson(),
    'msg': msg,
  };
}

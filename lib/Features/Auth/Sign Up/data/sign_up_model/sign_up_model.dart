import 'sign_up_model_data.dart';

class SignUpModel {
  int? ret;
  SignUpModelData? data;
  String? msg;

  SignUpModel({this.ret, this.data, this.msg});

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    ret: json['ret'] as int?,
    data: json['data'] == null
        ? null
        : SignUpModelData.fromJson(json['data'] as Map<String, dynamic>),
    msg: json['msg'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'ret': ret,
    'data': data?.toJson(),
    'msg': msg,
  };
}

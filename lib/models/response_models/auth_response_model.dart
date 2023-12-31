// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:pppos/models/entities/user.dart';

class AuthResponseModel {
  User? user;
  String? token;
  String? expriedDate;

  AuthResponseModel({this.user, this.token, this.expriedDate});

  AuthResponseModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    expriedDate = json['expriedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    data['expriedDate'] = expriedDate;
    return data;
  }
}

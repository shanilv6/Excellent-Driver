
import 'dart:convert';

SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  SignupModel({
   required this.name,
    required this.email,
    required this.mobile,
    required this.password,
  });

  String name;
  String email;
  String mobile;
  String password;

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "mobile": mobile,
    "password": password,
  };
}

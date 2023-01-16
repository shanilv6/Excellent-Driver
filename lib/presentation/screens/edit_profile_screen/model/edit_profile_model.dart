
import 'dart:convert';

EditProfileModel editProfileModelFromJson(String str) => EditProfileModel.fromJson(json.decode(str));

String editProfileModelToJson(EditProfileModel data) => json.encode(data.toJson());

class EditProfileModel {
  EditProfileModel({
  required  this.name,
    required this.email,
    required  this.mobile,
    required this.password,
  });

  String name;
  String email;
  String mobile;
  String password;

  factory EditProfileModel.fromJson(Map<String, dynamic> json) => EditProfileModel(
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

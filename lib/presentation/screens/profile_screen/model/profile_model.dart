import 'dart:convert';

ProfileDataModel profileDataModelFromJson(String str) =>
    ProfileDataModel.fromJson(json.decode(str));

String profileDataModelToJson(ProfileDataModel data) =>
    json.encode(data.toJson());

class ProfileDataModel {
  ProfileDataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
  });

  int id;
  String name;
  String email;
  String mobile;

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) =>
      ProfileDataModel(
        id: json["id"] == null ? null :json["id"] ,
        name: json["name"] == null ? null :json["name"] ,
        email: json["email"] == null ? null :json["email"] ,
        mobile: json["mobile"] == null ? null :json["mobile"] ,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
      };
}

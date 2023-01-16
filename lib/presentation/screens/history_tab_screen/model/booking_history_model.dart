

import 'dart:convert';

BoookingHistoryModel boookingHistoryModelFromJson(String str) =>
    BoookingHistoryModel.fromJson(json.decode(str));

String boookingHistoryModelToJson(BoookingHistoryModel data) =>
    json.encode(data.toJson());

class BoookingHistoryModel {
  BoookingHistoryModel({
    required this.id,
    required this.pickupDate,
    required this.pickupTime,
    required this.pickupLocation,
    required this.dropLocation,
    required this.status,
  });

  int id;

  String pickupDate;
  String pickupTime;
  String pickupLocation;
  String dropLocation;

  String status;

  factory BoookingHistoryModel.fromJson(Map<String, dynamic> json) =>
      BoookingHistoryModel(
        id: json["id"],
        pickupDate: json["pickup_date"],
        pickupTime: json["pickup_time"],
        pickupLocation: json["pickup_location"],
        dropLocation: json["drop_location"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pickup_date": pickupDate,
        "pickup_time": pickupTime,
        "pickup_location": pickupLocation,
        "drop_location": dropLocation,
        "status": status,
      };
}

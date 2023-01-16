import 'dart:convert';

UpcomingBookingModel upcomingBookingModelFromJson(String str) =>
    UpcomingBookingModel.fromJson(json.decode(str));

String upcomingBookingModelToJson(UpcomingBookingModel data) =>
    json.encode(data.toJson());

class UpcomingBookingModel {
  UpcomingBookingModel({
    required this.name,
    required this.id,
    required this.pickupDate,
    required this.pickupTime,
    required this.pickupLocation,
    required this.dropLocation,
  });

  int id;
  String name;
  String? pickupDate;
  String? pickupTime;
  String? pickupLocation;
  String? dropLocation;

  factory UpcomingBookingModel.fromJson(Map<String, dynamic> json) =>
      UpcomingBookingModel(
        name: json["name"],
        id: json["id"],
        pickupDate: json["pickup_date"],
        pickupTime: json["pickup_time"],
        pickupLocation: json["pickup_location"],
        dropLocation: json["drop_location"],
      );

  Map<String, dynamic> toJson() => {
        "name":name,
        "id": id,
        "pickup_date": pickupDate,
        "pickup_time": pickupTime,
        "pickup_location": pickupLocation,
        "drop_location": dropLocation,
      };
}

import 'dart:convert';

BookingModel bookingModelFromJson(String str) => BookingModel.fromJson(json.decode(str));

String bookingModelToJson(BookingModel data) => json.encode(data.toJson());

class BookingModel {
  BookingModel({
  required  this.name,
    required this.mobile,
    required  this.pickupDate,
    required this.pickupTime,
    required this.pickupLocation,
    required this.dropLocation,
  });

  String name;
  String mobile;
  String pickupDate;
  String pickupTime;
  String pickupLocation;
  String dropLocation;

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
    name: json["name"],
    mobile: json["mobile"],
    pickupDate:json["pickup_date"],
    pickupTime: json["pickup_time"],
    pickupLocation: json["pickup_location"],
    dropLocation: json["drop_location"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "mobile": mobile,
    "pickup_date": pickupDate,
    "pickup_time": pickupTime,
    "pickup_location": pickupLocation,
    "drop_location": dropLocation,
  };
}

// To parse this JSON data, do
//
//     final predictDetails = predictDetailsFromJson(jsonString);

import 'dart:convert';

PredictDetails predictDetailsFromJson(String str) => PredictDetails.fromJson(json.decode(str));

String predictDetailsToJson(PredictDetails data) => json.encode(data.toJson());

class PredictDetails {
  int kmDriven;
  String fuel;
  String sellerType;
  String transmission;
  String owner;
  double mileage;
  int engine;
  int maxPower;
  int seats;
  String brand;
  int vehicleAge;

  PredictDetails({
    required this.kmDriven,
    required this.fuel,
    required this.sellerType,
    required this.transmission,
    required this.owner,
    required this.mileage,
    required this.engine,
    required this.maxPower,
    required this.seats,
    required this.brand,
    required this.vehicleAge,
  });

  factory PredictDetails.fromJson(Map<String, dynamic> json) => PredictDetails(
    kmDriven: json["km_driven"],
    fuel: json["fuel"],
    sellerType: json["seller_type"],
    transmission: json["transmission"],
    owner: json["owner"],
    mileage: json["mileage"]?.toDouble(),
    engine: json["engine"],
    maxPower: json["max_power"],
    seats: json["seats"],
    brand: json["brand"],
    vehicleAge: json["vehicle_age"],
  );

  Map<String, dynamic> toJson() => {
    "km_driven": kmDriven,
    "fuel": fuel,
    "seller_type": sellerType,
    "transmission": transmission,
    "owner": owner,
    "mileage": mileage,
    "engine": engine,
    "max_power": maxPower,
    "seats": seats,
    "brand": brand,
    "vehicle_age": vehicleAge,
  };
}

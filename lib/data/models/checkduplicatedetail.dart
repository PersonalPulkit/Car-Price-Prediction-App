// To parse this JSON data, do
//
//     final checkDuplicateDetails = checkDuplicateDetailsFromJson(jsonString);

import 'dart:convert';

CheckDuplicateDetails checkDuplicateDetailsFromJson(String str) => CheckDuplicateDetails.fromJson(json.decode(str));

String checkDuplicateDetailsToJson(CheckDuplicateDetails data) => json.encode(data.toJson());

class CheckDuplicateDetails {
  String email;
  String username;

  CheckDuplicateDetails({
    required this.email,
    required this.username,
  });

  factory CheckDuplicateDetails.fromJson(Map<String, dynamic> json) => CheckDuplicateDetails(
    email: json["email"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "username": username,
  };
}

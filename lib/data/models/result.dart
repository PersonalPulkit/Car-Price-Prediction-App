// To parse this JSON data, do
//
//     final result = resultFromJson(jsonString);

import 'dart:convert';

Result resultFromJson(String str) => Result.fromJson(json.decode(str));

String resultToJson(Result data) => json.encode(data.toJson());

class Result {
  double prediction;

  Result({
    required this.prediction,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    prediction: json["prediction"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "prediction": prediction,
  };
}

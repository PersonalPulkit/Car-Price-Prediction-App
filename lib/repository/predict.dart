

import 'package:flutter/foundation.dart';

import '../data/models/predictdetails.dart';
import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';
import 'api_url.dart';
import 'header.dart';

class PredictDetailsService{

  final BaseApiServices _predictDetails = NetworkApiServies();
  Future<dynamic> predictDetailsApi(PredictDetails details) async {
    try {
      dynamic response = await _predictDetails.getPostApiServices(
          ApiUrl.predict,
          Header.checkDuplicateDetailsHeader,
          predictDetailsToJson(details));

      return response;
    } catch (e) {

        if (kDebugMode) {
          print(e);
        }
        print("exception");

    }
  }
}
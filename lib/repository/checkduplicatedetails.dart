import 'package:flutter/foundation.dart';


import '../data/models/checkduplicatedetail.dart';
import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';
import 'api_url.dart';
import 'header.dart';

class CheckDuplicateDetailsService {
  final BaseApiServices _checkDetails = NetworkApiServies();

  Future<dynamic> checkDetailsApi(CheckDuplicateDetails details) async {
    try {
      dynamic response = await _checkDetails.getPostApiServices(
          ApiUrl.predict,
          Header.checkDuplicateDetailsHeader,
          checkDuplicateDetailsToJson(details));
      return response;
    } catch (e) {
      if (kDebugMode) {
        print(e);
        print("exception");
      }
    }
  }
}

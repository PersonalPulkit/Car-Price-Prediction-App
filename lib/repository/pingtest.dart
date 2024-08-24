

import 'package:flutter/foundation.dart';

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';
import 'api_url.dart';

class PingService {
  final BaseApiServices _pingTest = NetworkApiServies();

  Future<dynamic> pingTestApi() async {
    try {
      dynamic response =
          await _pingTest.getGetApiServices(ApiUrl.baseUrl);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print(e);
        print("exception");
      }
    }
  }
}

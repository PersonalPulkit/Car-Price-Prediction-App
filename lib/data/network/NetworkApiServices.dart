import 'dart:convert';
import 'dart:io';


import 'package:http/http.dart' as http;

import '../../constants/constants.dart';
import '../../repository/header.dart';
import '../app_exceptions.dart';
import 'BaseApiServices.dart';

class NetworkApiServies extends BaseApiServices {
  @override
  Future getGetApiServices(String url) async {
    // TODO: implement getGetApiServices
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson=returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiServices(String url,Map<String,String> header, String body) async {
    // TODO: implement getPostApiServices
    dynamic responseJson;

    try{
      final response = await http.post(Uri.parse(url),headers: header,body: body,);
      responseJson=returnResponse(response);

    }on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;

    // throw UnimplementedError();
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataException(
            'Error occurred while connecting with server with status code ${response.statusCode}');
    }
  }
}

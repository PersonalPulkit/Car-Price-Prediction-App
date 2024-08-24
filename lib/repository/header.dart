import '../constants/constants.dart';

class Header{
  static const Map<String, String> checkDuplicateDetailsHeader = <String, String>{
    'Content-Type': 'application/json',
    'API_key_header': Constants.uatApiKey,
  };
}
abstract class BaseApiServices {
  Future<dynamic> getGetApiServices(String url);
  Future<dynamic> getPostApiServices(String url, Map<String,String> header, String body);
  // Future<dynamic> getPutApiServices(String url);
  // Future<dynamic> getDeleteApiServices(String url);
  // Future<dynamic> getPatchApiServices(String url);
}

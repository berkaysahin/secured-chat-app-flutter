import 'dart:convert';
import 'package:http/http.dart' as http;

class RestConnector {
  String url;
  String requestType;
  String data;
  String dataType;
  bool cacheRefresh;
  String jwtToken;
  RestConnector(
    this.url,
    this.jwtToken, {
    this.requestType: "GET",
    this.data: "",
    this.dataType: "json",
    this.cacheRefresh: false,
  });

  getData() async {
    http.Response response;
    if (requestType == 'GET') {
      response = await http.get(
        Uri.parse(url),
        headers: {
          'content-type': 'application/json',
          'Authorization': 'Bearer ' + jwtToken.toString(),
        },
      );
    } else if (requestType == 'POST') {
      response = await http.post(
        Uri.parse(url),
        body: data,
        headers: {
          'content-type': 'application/json',
          'Authorization': 'Bearer ' + jwtToken.toString(),
        },
      );
    } else if (requestType == "PUT") {
      response = await http.put(
        Uri.parse(url),
        body: data,
        headers: {
          'content-type': 'application/json',
          'Authorization': 'Bearer ' + jwtToken.toString(),
        },
      );
    }
    var parsedResponse = json.decode(response.body);
    return parsedResponse;
  }
}

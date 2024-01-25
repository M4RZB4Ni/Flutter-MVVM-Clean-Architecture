import 'package:communere/app/network/network_enums.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class NetworkClient {


  Future<http.Response> sendRequest(
      final String url,
      {
        required final HttpRequestType requestType,
        final HttpResponseType responseType = HttpResponseType.REST,
        final dynamic params,
        final String? customToken,
        final Map<String, String>? headers,
      }) async {
    http.Response? response;
    Map<String, String>? requestHeader = {
      'Content-Type': 'application/json',
      'Connection': 'keep-alive',
      'platform': 'Mobile',
    };

    if (headers != null) requestHeader = headers;

    switch (requestType) {
      case HttpRequestType.POST:
        response = await http.post(Uri.parse(url),
            body: json.encode(params), headers: requestHeader);
        return  response;

      case HttpRequestType.GET:
        response = await http.get(Uri.parse(url), headers: requestHeader);
        return response;

      case HttpRequestType.PUT:
        response = await http.put(Uri.parse(url),
            body: json.encode(params), headers: requestHeader);
        return response;
      case HttpRequestType.PATCH:
        response = await http.patch(Uri.parse(url),
            headers: requestHeader, body: json.encode(params));
        return response;
    }
  }
}

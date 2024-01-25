import 'package:communere/app/base/api_result.dart';
import 'package:communere/app/network/exception_handler.dart';
import 'package:communere/app/network/network_enums.dart';
import 'package:communere/app/network/response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:xml2json/xml2json.dart';



class NetworkClient {

  final _myTransformer = Xml2Json();



  Response _responseHandler(final HttpResponseType responseType,http.Response response){

      if(response.statusCode<300 && response.statusCode>=200)
        {
          switch(responseType)
              {
            case HttpResponseType.REST:
              _myTransformer.parse(response.body.toString());
              return Response(status: true, result: _myTransformer.toGData(), statusCode: response.statusCode);

            case HttpResponseType.XML:
              return Response(status: true, result: response.body, statusCode: response.statusCode);
          }
        }else{
          return Response(status: false, result: response.body, statusCode: response.statusCode);
      }
  }


  Future<Response> sendRequest(
      final String url,
      {
        required final HttpRequestType requestType,
        final HttpResponseType responseType = HttpResponseType.REST,
        final dynamic bodyData,
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
            body: json.encode(bodyData), headers: requestHeader);

        return  _responseHandler(responseType, response);

      case HttpRequestType.GET:
        response = await http.get(Uri.parse(url), headers: requestHeader);
        return  _responseHandler(responseType, response);

      case HttpRequestType.PUT:
        response = await http.put(Uri.parse(url),
            body: json.encode(bodyData), headers: requestHeader);
        return  _responseHandler(responseType, response);
      case HttpRequestType.PATCH:
        response = await http.patch(Uri.parse(url),
            headers: requestHeader, body: json.encode(bodyData));
        return  _responseHandler(responseType, response);
    }
  }
}

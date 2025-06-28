import 'dart:convert';
import 'dart:io';
import 'dart:async'; // For TimeoutException

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../app_exception.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print('GET: $url');
    }

    dynamic responseJson;
    try {
      final response = await http
          .get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      )
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('No Internet Connection');
    } on TimeoutException {
      throw RequestTimeOut('Request Timed Out');
    } catch (e) {
      throw FetchDataException('Unexpected error: $e');
    }

    return responseJson;
  }

  @override
  Future<dynamic> postApi(dynamic data, String url) async {
    if (kDebugMode) {
      print('POST: $url');
      print('Body: $data');
    }

    dynamic responseJson;
    try {
      final response = await http
          .post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      )
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('No Internet Connection');
    } on TimeoutException {
      throw RequestTimeOut('Request Timed Out');
    } catch (e) {
      throw FetchDataException('Unexpected error: $e');
    }
    if(kDebugMode){
      print(responseJson);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);

      case 400:
        throw InvalidUrlException('Bad Request');

      case 401:
        throw FetchDataException('Unauthorized Request');

      case 404:
        throw FetchDataException('Resource Not Found');

      case 500:
        throw ServerException('Internal Server Error');

      default:
        throw FetchDataException(
          'Error occurred while communicating with server. Status Code: ${response.statusCode}',
        );
    }
  }
}

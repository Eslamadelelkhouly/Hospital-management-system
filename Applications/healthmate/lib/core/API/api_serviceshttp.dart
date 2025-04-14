import 'dart:async';
import 'dart:developer';

import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/shared_perfernce_singletone.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class ApiServiceshttp {
  final http.Client client;

  ApiServiceshttp({required this.client});

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    try {
      final String? bearerToken =
          await SharedPreferenceSingleton.getString(token);

      if (bearerToken == null || bearerToken.isEmpty) {
        throw Exception('Authentication token missing');
      }

      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearerToken',
      };

      final response = await client
          .get(
            Uri.parse(endpoint),
            headers: headers,
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData == null) {
          throw Exception('Server returned null response');
        }
        return responseData as Map<String, dynamic>;
      } else {
        // Handle different status codes
        throw HttpException(
          'Request failed with status: ${response.statusCode}',
          uri: Uri.parse(endpoint),
        );
      }
    } on SocketException catch (e) {
      log('SocketException: $e');
      throw HttpException(
        'Network error occurred',
        uri: Uri.parse(endpoint),
      );
    } on TimeoutException catch (e) {
      log('TimeoutException: $e');
      throw HttpException(
        'Request timed out',
        uri: Uri.parse(endpoint),
      );
    } on http.ClientException catch (e) {
      log('ClientException: $e');
      throw HttpException(
        'Client error occurred',
        uri: Uri.parse(endpoint),
      );
    } on FormatException catch (e) {
      log('FormatException: $e');
      throw HttpException(
        'Invalid response format',
        uri: Uri.parse(endpoint),
      );
    } catch (e) {
      log('Unexpected error: $e');
      throw HttpException(
        'Unexpected error: $e',
        uri: Uri.parse(endpoint),
      );
    }
  }
}

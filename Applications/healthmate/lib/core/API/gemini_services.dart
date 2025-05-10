import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiServices {
  static const _apikey = 'AIzaSyA4T0ztdoQQLPofDXgV66qb1FSsisRhc0s';
  static final GenerativeModel _geminiModel = GenerativeModel(
    apiKey: _apikey,
    model: 'gemini-1.5-flash',
  );

  Future<Either<String, String>> getResponse(String message) async {
    try {
      log('Message: $message');
      final content = [Content.text('$message')];
      final response = await _geminiModel.generateContent(content);
      log('Response: ${response.text}');
      if (response.text == null || response.text!.isEmpty) {
        return Left('No response from Gemini');
      }
      return Right(response.text!);
    } catch (e) {
      log(e.toString());
      return Left('Error: $e');
    }
  }
}

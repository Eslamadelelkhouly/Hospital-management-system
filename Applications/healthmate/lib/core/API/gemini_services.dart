import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiServices {
  static const _apikey = 'AIzaSyCm5HavopB3J97E85h7Tqt3416PNzoc4rk';
  static final GenerativeModel _geminiModel = GenerativeModel(
    apiKey: _apikey,
    model: 'gemini-pro',
  );
  Future<Either<String, String>> getResponse(String message) async {
    try {
      final content = [Content.text(message)];
      final response = await _geminiModel.generateContent(content);
      log('Response: ${response.text}');
      if (response.text == null) {
        return Left('No response from Gemini');
      }
      if (response.text!.isEmpty) {
        return Left('No response from Gemini');
      }
      return Right(response.text! ?? 'No response from Gemini');
    } catch (e) {
      log(e.toString());
      return Left('Error: $e');
    }
  }
}

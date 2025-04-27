import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiServices {
  static const _apikey = 'AIzaSyCm5HavopB3J97E85h7Tqt3416PNzoc4rk';
  static final GenerativeModel _geminiModel = GenerativeModel(
    apiKey: _apikey,
    model: 'models/gemini-1.5-pro-latest',
  );

  Future<Either<String, String>> getResponse(String message) async {
    try {
      log('Message: $message');
      final content = [
        Content.text(
            '''ou are a professional medical doctor. Your task is to provide reliable medical advice based on the information provided by the user. 
            If the case is complex or requires a precise diagnosis, kindly advise the user to visit a real doctor. 
            Now, this is the user's question: $message''')
      ];
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

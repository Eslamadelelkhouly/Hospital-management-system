import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiServices {
  static const _apikey = 'AIzaSyDzY5EFHcgVOtxQ-XAh6WLMFhThfefC8kM';
  static final GenerativeModel _geminiModel = GenerativeModel(
    apiKey: _apikey,
    model: 'gemini-1.5-flash',
  );

  Future<Either<String, String>> getResponse(String message) async {
    try {
      log('Message: $message');

      // ✅ Prompt احترافي باللغة العربية بدون أقواس أو Markdown
      String prompt = '''
أنا أعاني من الأعراض التالية:
$message

يرجى تزويدي بتشخيص طبي مبدئي بناءً على هذه الأعراض، مع اقتراح خطة علاجية مناسبة، وأسماء الأدوية المحتملة والجرعات المقترحة إن وُجدت. 

من فضلك قدّم الإجابة بطريقة طبية منظمة وسهلة الفهم بدون استخدام أي رموز أو علامات مثل * أو - أو أقواس. لا تستخدم تنسيق Markdown.
    ''';

      final content = [Content.text(prompt)];
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

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:pest_gpt/src/utils/toast/toast_manager.dart';



class LLMController {
  GenerativeModel? _model;
  int totalRequests = 0;
  final int maxRequests = 3;

  LLMController() {
    try {
      initalizeModel();
    } catch (e) {
      ToastManager.showError("Failed to initalize Gemini model");
    }
  }

  initalizeModel() async {
    final apiKey = dotenv.env['GEMINI_API_KEY'];
    if (apiKey != null) {
      _model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: apiKey,
      );
    }
  }

  Future<String?> generateResponse(String prompt) async {
    if (_model == null) {
      await initalizeModel();
    }
    if (totalRequests >= maxRequests) {
      ToastManager.showError(
          "You have reached the maximum number of requests for this session");
      return null;
    }
    totalRequests++;
    final content = [Content.text(prompt)];
    final response = await _model!.generateContent(
      content,
      generationConfig: GenerationConfig(
        maxOutputTokens: 100,
        temperature: 0.5,
        responseMimeType: "application/json",
      ),
    );
    return response.text;
  }
}

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_connect/connect.dart';
import 'package:pest_gpt/src/models/pest/pest_info.dart';

const mockResponse = """
{
  "pest_info": "Aphids are small sap-sucking insects that affect a wide variety of plants, including roses, vegetables, fruit trees, and ornamental plants. They have a long history of being a major agricultural pest, causing damage by feeding on plant sap and transmitting plant viruses. Aphids reproduce rapidly, making them difficult to control once an infestation occurs.",
  "ideal_temperature": {
    "min": 15.0,
    "max": 30.0
  },
  "ideal_humidity": {
    "min": 60.0,
    "max": 80.0
  },
  "ideal_wind": {
    "min": 20.0,
    "max": 50.0
  },
  "precautions": [
    "1. Regularly inspect plants for signs of aphids.",
    "2. Use insecticidal soaps or neem oil as preventive measures.",
    "3. Encourage natural predators like ladybugs and lacewings.",
    "4. Avoid over-fertilizing plants as it can attract aphids."
  ],
  "pesticides": [
    {
      "name": "Insecticidal Soap",
      "cost": "15"
    },
    {
      "name": "Neem Oil",
      "cost": "20"
    },
    {
      "name": "Pyrethrin",
      "cost": "25"
    }
  ]
}
""";

class ChatGptService extends GetConnect {
  final String url = 'https://api.openai.com/v1/chat/completions';
  final Map<String, String> headers = {
    'Authorization': 'Bearer ${dotenv.env['CHAT_GPT_API_KEY']}',
    'Content-Type': 'application/json'
  };

  Future<LLMPestInfo> generateResponse(String pestName) async {
    return LLMPestInfo.fromJson(jsonDecode(mockResponse));
    final Map<String, dynamic> data = {
      "model": "gpt-4",
      "messages": [
        {"role": "system", "content": "You are an expert in pest management."},
        {
          "role": "user",
          "content":
              "Provide a JSON response with information about pest '$pestName'. Include pest_info: a short description of 150 words telling which plants it affects and its history. Then include idealTemperature, idealHumidity, and idealRainfall in which this pest grows, each as objects with min and max values of type double. Also include precautions to take to prevent this pest, and a list of pesticides with their costs."
        }
      ],
      "temperature": 0.7,
      "max_tokens": 100,
      "n": 1,
      "stop": null,
      "response_format": "json"
    };

    final response = await post(url, data, headers: headers);
    if (response.status.hasError) {
      throw Exception('Failed to generate response');
    } else {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      final String content = responseJson['choices'][0]['message']['content'];
      return LLMPestInfo.fromJson(jsonDecode(content));
    }
  }
}

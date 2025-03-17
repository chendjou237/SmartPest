import 'dart:convert';

import 'package:pest_gpt/src/models/pest/pest_detection_request.dart';
import 'package:pest_gpt/src/models/pest/pest_detection_response.dart';
import 'package:pest_gpt/src/resource/api_service/base_api_service.dart';

class PestDetectService extends BaseApiService {
  Future<PestDetectionResponse> detect(PestDetectionRequest request) async {
    var json = """
              [
  [
    {
      "original_shape": [
        1536,
        2048
      ],
      "class_id": 8.0,
      "class_name": "LADYBUG (COCCINELLIDAE)",
      "confidence": 0.8444573283195496,
      "box": [
        1624.705810546875,
        76.2587890625,
        1879.5042724609375,
        248.6437530517578
      ]
    },
    {
      "original_shape": [
        1536,
        2048
      ],
      "class_id": 5.0,
      "class_name": "FLY (DIPTERA)",
      "confidence": 0.7821442484855652,
      "box": [
        131.4945831298828,
        52.389259338378906,
        482.5311584472656,
        357.68670654296875
      ]
    },
    {
      "original_shape": [
        1536,
        2048
      ],
      "class_id": 8.0,
      "class_name": "LADYBUG (COCCINELLIDAE)",
      "confidence": 0.5365657210350037,
      "box": [
        437.46551513671875,
        964.0494384765625,
        699.06640625,
        1246.5013427734375
      ]
    },
    {
      "original_shape": [
        1536,
        2048
      ],
      "class_id": 0.0,
      "class_name": "INSECTA",
      "confidence": 0.535738468170166,
      "box": [
        60.168251037597656,
        1039.655517578125,
        467.12841796875,
        1452.6781005859375
      ]
    }
  ]
]
        """;

    await Future.delayed(Duration(seconds: 1));
    var data = JsonDecoder().convert(json);
    var detectionResponse = PestDetectionResponse.fromJson(data);
    return detectionResponse;
    final response = await postApi(
      '/plug/pest/detector',
      request.toJson(),
    );
    return PestDetectionResponse.fromJson(response);
  }
}

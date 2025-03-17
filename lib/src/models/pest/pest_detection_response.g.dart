// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pest_detection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PestDetectionResponse _$PestDetectionResponseFromJson(
        Map<String, dynamic> json) =>
    PestDetectionResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => DetectionItem.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );

Map<String, dynamic> _$PestDetectionResponseToJson(
        PestDetectionResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

DetectionItem _$DetectionItemFromJson(Map<String, dynamic> json) =>
    DetectionItem(
      originalShape: (json['original_shape'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      classId: (json['class_id'] as num).toDouble(),
      className: json['class_name'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      box: (json['box'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$DetectionItemToJson(DetectionItem instance) =>
    <String, dynamic>{
      'original_shape': instance.originalShape,
      'class_id': instance.classId,
      'class_name': instance.className,
      'confidence': instance.confidence,
      'box': instance.box,
    };

import 'package:json_annotation/json_annotation.dart';

part 'pest_detection_response.g.dart';

@JsonSerializable()
class PestDetectionResponse {
  List<List<DetectionItem>> items;

  PestDetectionResponse({required this.items});

  factory PestDetectionResponse.fromJson(List<dynamic> json) =>
      _$PestDetectionResponseFromJson({'items': json});

  List<dynamic> toJson() => _$PestDetectionResponseToJson(this)['items'];

  List<DetectionItem> getPestDetectionList() {
    List<DetectionItem> pestItems = [];
    for (var element in items) {
      pestItems.addAll(element);
    }
    return pestItems;
  }
}

@JsonSerializable()
class DetectionItem {
  @JsonKey(name: 'original_shape')
  List<int> originalShape;
  @JsonKey(name: 'class_id')
  double classId;
  @JsonKey(name: 'class_name')
  String className;
  double confidence;
  List<double> box;

  DetectionItem({
    required this.originalShape,
    required this.classId,
    required this.className,
    required this.confidence,
    required this.box,
  });

  factory DetectionItem.fromJson(Map<String, dynamic> json) =>
      _$DetectionItemFromJson(json);

  Map<String, dynamic> toJson() => _$DetectionItemToJson(this);
}

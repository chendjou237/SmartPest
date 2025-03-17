import 'package:json_annotation/json_annotation.dart';

part 'pest_detection_request.g.dart';

@JsonSerializable()
class PestDetectionRequest {
  @JsonKey(name: 'detection_list')
  final List<String> detectionList;

  PestDetectionRequest({
    required this.detectionList,
  });

  factory PestDetectionRequest.fromJson(Map<String, dynamic> json) =>
      _$PestDetectionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PestDetectionRequestToJson(this);
}

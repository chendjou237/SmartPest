import 'package:json_annotation/json_annotation.dart';

part 'pest_info.g.dart';

@JsonSerializable(explicitToJson: true)
class LLMPestInfo {
  @JsonKey(name: 'ideal_temperature')
  final MinMaxValue? idealTemperature;
  @JsonKey(name: 'ideal_humidity')
  final MinMaxValue? idealHumidity;
  @JsonKey(name: 'ideal_wind')
  final MinMaxValue? idealWindSpeed;
  final List<String>? precautions;
  final List<Pesticide>? pesticides;
  @JsonKey(name: 'pest_info')
  final String? pestInfo;

  LLMPestInfo({
    this.idealTemperature,
    this.precautions,
    this.pesticides,
    this.pestInfo,
    this.idealHumidity,
    this.idealWindSpeed,
  });

  factory LLMPestInfo.fromJson(Map<String, dynamic> json) =>
      _$LLMPestInfoFromJson(json);
  Map<String, dynamic> toJson() => _$LLMPestInfoToJson(this);
}

@JsonSerializable()
class MinMaxValue {
  final double min;
  final double max;

  MinMaxValue({
    required this.min,
    required this.max,
  });

  factory MinMaxValue.fromJson(Map<String, dynamic> json) =>
      _$MinMaxValueFromJson(json);
  Map<String, dynamic> toJson() => _$MinMaxValueToJson(this);
}

@JsonSerializable()
class Pesticide {
  final String name;
  final String cost;

  Pesticide({
    required this.name,
    required this.cost,
  });

  factory Pesticide.fromJson(Map<String, dynamic> json) =>
      _$PesticideFromJson(json);
  Map<String, dynamic> toJson() => _$PesticideToJson(this);
}

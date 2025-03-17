// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pest_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LLMPestInfo _$LLMPestInfoFromJson(Map<String, dynamic> json) => LLMPestInfo(
      idealTemperature: json['ideal_temperature'] == null
          ? null
          : MinMaxValue.fromJson(
              json['ideal_temperature'] as Map<String, dynamic>),
      precautions: (json['precautions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      pesticides: (json['pesticides'] as List<dynamic>?)
          ?.map((e) => Pesticide.fromJson(e as Map<String, dynamic>))
          .toList(),
      pestInfo: json['pest_info'] as String?,
      idealHumidity: json['ideal_humidity'] == null
          ? null
          : MinMaxValue.fromJson(
              json['ideal_humidity'] as Map<String, dynamic>),
      idealWindSpeed: json['ideal_wind'] == null
          ? null
          : MinMaxValue.fromJson(json['ideal_wind'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LLMPestInfoToJson(LLMPestInfo instance) =>
    <String, dynamic>{
      'ideal_temperature': instance.idealTemperature?.toJson(),
      'ideal_humidity': instance.idealHumidity?.toJson(),
      'ideal_wind': instance.idealWindSpeed?.toJson(),
      'precautions': instance.precautions,
      'pesticides': instance.pesticides?.map((e) => e.toJson()).toList(),
      'pest_info': instance.pestInfo,
    };

MinMaxValue _$MinMaxValueFromJson(Map<String, dynamic> json) => MinMaxValue(
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
    );

Map<String, dynamic> _$MinMaxValueToJson(MinMaxValue instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };

Pesticide _$PesticideFromJson(Map<String, dynamic> json) => Pesticide(
      name: json['name'] as String,
      cost: json['cost'] as String,
    );

Map<String, dynamic> _$PesticideToJson(Pesticide instance) => <String, dynamic>{
      'name': instance.name,
      'cost': instance.cost,
    };

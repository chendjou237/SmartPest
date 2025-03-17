// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastWeatherResponse _$ForecastWeatherResponseFromJson(
        Map<String, dynamic> json) =>
    ForecastWeatherResponse(
      place: City.fromJson(json['city'] as Map<String, dynamic>),
      cod: json['cod'] as String,
      message: (json['message'] as num).toDouble(),
      cnt: (json['cnt'] as num).toInt(),
      list: (json['list'] as List<dynamic>)
          .map((e) => Forecast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastWeatherResponseToJson(
        ForecastWeatherResponse instance) =>
    <String, dynamic>{
      'city': instance.place,
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.list,
    };

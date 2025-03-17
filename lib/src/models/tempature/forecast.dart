/*
 * Author : Manu Kenchappa Junjanna
 * Email : manu1998kj@gmail.com
 * Created on Wed Jul 03 2024
 */

import 'package:json_annotation/json_annotation.dart';
import 'package:pest_gpt/src/models/tempature/feels_like.dart';
import 'package:pest_gpt/src/models/tempature/temperature.dart';
import 'package:pest_gpt/src/models/tempature/weather_description.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  final int dt;
  final int sunrise;
  final int sunset;
  @JsonKey(name: 'temp')
  final Temperature temperature; // usefull
  @JsonKey(name: 'feels_like')
  final FeelsLike feelsLike;
  final int pressure; // usefull
  final int humidity; // usefull
  final List<WeatherDescription> weather;
  final double speed; // usefull
  final int deg;
  final double gust;
  final int clouds;
  final double pop;
  final double? rain;

  Forecast({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temperature,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.weather,
    required this.speed,
    required this.deg,
    required this.gust,
    required this.clouds,
    required this.pop,
    this.rain,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}

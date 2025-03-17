import 'package:json_annotation/json_annotation.dart';
import 'package:pest_gpt/src/models/tempature/city.dart';
import 'package:pest_gpt/src/models/tempature/forecast.dart';

part 'forecast_weather_response.g.dart';

@JsonSerializable()
class ForecastWeatherResponse {
  @JsonKey(name: 'city')
  final City place;
  final String cod;
  final double message;
  final int cnt;
  final List<Forecast> list;

  ForecastWeatherResponse({
    required this.place,
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
  });

  factory ForecastWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$ForecastWeatherResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastWeatherResponseToJson(this);
}

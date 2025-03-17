/*
 * Author : Manu Kenchappa Junjanna
 * Email : manu1998kj@gmail.com
 * Created on Wed Jul 03 2024
 */

import 'package:json_annotation/json_annotation.dart';

part 'weather_description.g.dart';

@JsonSerializable()
class WeatherDescription {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherDescription({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherDescription.fromJson(Map<String, dynamic> json) =>
      _$WeatherDescriptionFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherDescriptionToJson(this);
}

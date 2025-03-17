/*
 * Author : Manu Kenchappa Junjanna
 * Email : manu1998kj@gmail.com
 * Created on Wed Jul 03 2024
 */

import 'package:json_annotation/json_annotation.dart';

part 'temperature.g.dart';

@JsonSerializable()
class Temperature {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  Temperature({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) => _$TemperatureFromJson(json);
  Map<String, dynamic> toJson() => _$TemperatureToJson(this);
}
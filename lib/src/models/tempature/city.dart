/*
 * Author : Manu Kenchappa Junjanna
 * Email : manu1998kj@gmail.com
 * Created on Wed Jul 03 2024
 */

import 'package:json_annotation/json_annotation.dart';
import 'package:pest_gpt/src/models/tempature/coordinate.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  final int id;
  final String name;
  @JsonKey(name: 'coord')
  final Coordinate cityCoordinate;
  final String country;
  final int population;
  final int timezone;

  City({
    required this.id,
    required this.name,
    required this.cityCoordinate,
    required this.country,
    required this.population,
    required this.timezone,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);
}

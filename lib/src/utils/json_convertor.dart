import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class Uint8ListConverter implements JsonConverter<Uint8List, List<int>> {
  const Uint8ListConverter();

  @override
  Uint8List fromJson(List<int> json) => Uint8List.fromList(json);

  @override
  List<int> toJson(Uint8List object) => object.toList();
}

// Convert Color to int
int colorToJson(Color color) => color.value;

// Convert int to Color
Color colorFromJson(int value) => Color(value);

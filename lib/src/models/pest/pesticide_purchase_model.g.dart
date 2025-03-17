// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pesticide_purchase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PesticidePurchaseModel _$PesticidePurchaseModelFromJson(
        Map<String, dynamic> json) =>
    PesticidePurchaseModel(
      name: json['name'] as String,
      cost: (json['cost'] as num).toInt(),
      dateOfPurchase: DateTime.parse(json['dateOfPurchase'] as String),
    );

Map<String, dynamic> _$PesticidePurchaseModelToJson(
        PesticidePurchaseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cost': instance.cost,
      'dateOfPurchase': instance.dateOfPurchase.toIso8601String(),
    };

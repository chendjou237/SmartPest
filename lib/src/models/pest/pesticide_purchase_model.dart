import 'package:json_annotation/json_annotation.dart';

part 'pesticide_purchase_model.g.dart';

@JsonSerializable()
class PesticidePurchaseModel {
  final String name;
  final int cost;
  final DateTime dateOfPurchase;

  PesticidePurchaseModel({
    required this.name,
    required this.cost,
    required this.dateOfPurchase,
  });

  factory PesticidePurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$PesticidePurchaseModelFromJson(json);
  Map<String, dynamic> toJson() => _$PesticidePurchaseModelToJson(this);
}

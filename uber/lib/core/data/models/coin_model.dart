

import '../../domain/entities/coin_entity.dart';

class CoinModel extends CoinEntity{
  CoinModel({
    required super.id,
    required super.name,
    required super.description,
    required super.isoCode,
    required super.isDeleted,
    required super.createdAt,
    required super.updatedAt
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) => CoinModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    isoCode: json["iso_code"],
    isDeleted: json["is_deleted"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );



}


import '../../domain/entities/taxi_entity.dart';

class TaxiModel extends TaxiEntity{
  TaxiModel({required super.id, required super.code, required super.description, required super.status, required super.value, required super.isDeleted, required super.createdAt, required super.updatedAt});
  factory TaxiModel.fromJson(Map<String, dynamic> json) => TaxiModel(
    id: json["id"],
    code: json["code"],
    description: json["description"],
    status: json["status"],
    value: json["value"],
    isDeleted: json["is_deleted"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );
}


import '../../domain/entities/product_service_typology_entity.dart';

class ProductServiceTypologyModel extends ProductServiceTypologyEntity{
  ProductServiceTypologyModel({
    required super.id,
    required super.code,
    required super.description,
    required super.sigla,
    required super.createdAt,
    required super.updatedAt
  });

  factory ProductServiceTypologyModel.fromJson(Map<String, dynamic> json) => ProductServiceTypologyModel(
    id: json["id"],
    code: json["code"],
    description: json["description"],
    sigla: json["sigla"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

}
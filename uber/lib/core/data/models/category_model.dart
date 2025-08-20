

import '../../domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity{
  CategoryModel({required super.id, required super.description, required super.isDeleted, required super.createdAt, required super.updatedAt});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["id"],
    description: json["description"],
    isDeleted: json["is_deleted"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );
}
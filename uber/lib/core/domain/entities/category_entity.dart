
import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable{
  CategoryEntity({required this.id, required this.description, required this.isDeleted, required this.createdAt, required this.updatedAt});

  final int id;
  final String description;
  final int isDeleted;
  final String? createdAt;
  final String? updatedAt;

  @override
  List<Object?> get props => [
  id,
  description,
  isDeleted,
  createdAt,
  updatedAt,
  ];

}
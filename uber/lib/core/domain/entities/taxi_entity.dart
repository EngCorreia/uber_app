

import 'package:equatable/equatable.dart';

class TaxiEntity extends Equatable{
  TaxiEntity({required this.id, required this.code, required this.description, required this.status, required this.value, required this.isDeleted, required this.createdAt, required this.updatedAt});

  final int id;
  final String code;
  final String description;
  final String status;
  final int value;
  final int isDeleted;
  final String? createdAt;
  final String? updatedAt;

  @override
  List<Object?> get props => [
  id,
  code,
  description,
  status,
  value,
  isDeleted,
  createdAt,
  updatedAt
  ];

}
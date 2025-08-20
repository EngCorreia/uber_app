

import 'package:equatable/equatable.dart';

class CoinEntity extends Equatable{
  CoinEntity({required this.id, required this.name, required this.description, required this.isoCode, required this.isDeleted, required this.createdAt, required this.updatedAt});

  final int id;
  final String name;
  final String description;
  final String isoCode;
  final int isDeleted;
  final String? createdAt;
  final String? updatedAt;


  @override
  List<Object?> get props => [
  id,
  name,
  description,
  isoCode,
  isDeleted,
  createdAt,
  updatedAt
  ];

}


import 'package:equatable/equatable.dart';

class ProductServiceTypologyEntity extends Equatable{
  ProductServiceTypologyEntity({required this.id, required this.code, required this.description, required this.sigla, required this.createdAt, required this.updatedAt});

  final int id;
  final String code;
  final String description;
  final String sigla;
  final String createdAt;
  final String updatedAt;

  @override
  List<Object?> get props => [
  id,
  code,
  description,
  sigla,
  createdAt,
  updatedAt
  ];

}
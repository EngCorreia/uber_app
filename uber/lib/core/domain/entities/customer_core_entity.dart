

import 'package:equatable/equatable.dart';

class CustomerCoreEntity extends Equatable{
  CustomerCoreEntity({required this.id, required this.username, required this.email, required this.rememberMeToken, required this.createdAt, required this.updatedAt, required this.name, required this.code, required this.address, required this.customerCategoryId, required this.sector, required this.nif, required this.uuid, required this.phone, required this.street, required this.city, required this.postalCode, required this.mainUser, required this.mainUserId, required this.coreCustomerId});


  final int id;
  final String username;
  final String email;
  final String? rememberMeToken;
  final String createdAt;
  final String updatedAt;
  final String? name;
  final String? code;
  final String? address;
  final int? customerCategoryId;
  final String? sector;
  final String? nif;
  final String? uuid;
  final String? phone;
  final String? street;
  final String? city;
  final int? postalCode;
  final String? mainUser;
  final int? mainUserId;
  final int coreCustomerId;



  @override
  List<Object?> get props => [
  id,
  username,
  email,
  rememberMeToken,
  createdAt,
  updatedAt,
  name,
  code,
  address,
  customerCategoryId,
  sector,
  nif,
  uuid,
  phone,
  street,
  city,
  postalCode,
  mainUser,
  mainUserId,
  coreCustomerId
  ];

}
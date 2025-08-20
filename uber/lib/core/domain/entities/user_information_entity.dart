import 'package:equatable/equatable.dart';

class UserInformationEntity extends Equatable{

  UserInformationEntity({
    required this.id,
    required this.username,
    required this.email,
    required this.rememberMeToken,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.code,
    required this.address,
    required this.customerCategoryId,
    required this.sector,
    required this.nif,
    required this.uuid,
    required this.phone,
   required this.street,
   required this.city,
   required this.postalCode,
   required this.mainUser,
   required this.mainUserId,
   required this.employee,
   required this.token,
   required this.refreshToken,
   required this.expiresAt,
    this.isDeleted,
    this.coreCustomerId,
    this.customerType,
    this.isActive,
    this.isPasswordChanged
 });

  // USER
  final int id;
  final String username;
  final String email;
  final String? rememberMeToken;
  final String? createdAt;
  final String? updatedAt;
  final String? name;
  final String? code;
  final String? address;
  final int? customerCategoryId;
  final String? sector;
  final String? nif;
  final int? isDeleted;
  final String? uuid;
  final String? phone;
  final String? street;
  final String? city;
  final String? postalCode;
  final int? mainUser;
  final int? mainUserId;
  final String? employee;
  final String token;
  final String refreshToken;
  final String expiresAt;
  final int? coreCustomerId;
  final int? isPasswordChanged;
  final int? isActive;
  final String? customerType;


  @override
  List<Object?> get props => [
  id,
  username,
  email,
    isDeleted,
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
  employee,
  token,
  refreshToken,
  expiresAt,
  ];

}

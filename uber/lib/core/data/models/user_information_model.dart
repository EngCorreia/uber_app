import 'dart:developer';

import '../../domain/entities/user_information_entity.dart';

class UserInformationModel extends UserInformationEntity{

  UserInformationModel({
    required super.id,
    required super.username,
    required super.email,
    required super.rememberMeToken,
    required super.createdAt,
    required super.updatedAt,
    required super.name,
    required super.code,
    required super.address,
    required super.customerCategoryId,
    required super.sector,
    required super.nif,
    required super.uuid,
    required super.phone,
    required super.street,
    required super.city,
    required super.postalCode,
    required super.mainUser,
    required super.mainUserId,
    super.employee,
    required super.token,
    super.isDeleted,
    super.coreCustomerId,
    super.customerType,
    super.isPasswordChanged,
    super.isActive,
    required super.refreshToken,
    required super.expiresAt});



  factory UserInformationModel.fromMap( Map<String,dynamic> user){
    return UserInformationModel(
      id: user["id"],//ok
      username: user["username"],//ok
      email: user["email"],
      rememberMeToken: user["remember_me_token"] ?? "",
      createdAt: user["created_at"],
      updatedAt: user["updated_at"],
      name: user["name"] ?? "",
      code: user["code"] ?? "",
      address: user["address"] ?? "",
      customerCategoryId: user["customer_category_id"],
      sector: user["sector"],
      nif: user["nif"],
      uuid: user["uuid"] ?? "",
      phone: user["phone"] ?? "",
      street: user["street"] ?? "",
      city: user["city"] ?? "",
      postalCode: user["postal_code"],
      mainUser: user["main_user"] ?? "",
      mainUserId: user["main_user_id"],
      employee: user["employee"] ?? "",
      token: user["token"],
      refreshToken: user["refreshToken"],
      expiresAt: user["expires_at"],

    );
  }

  factory UserInformationModel.update(Map<String,dynamic> json,UserInformationEntity userUpdate){
    Map<String,dynamic> user = json["data"]["value"];

    return UserInformationModel(
      id: user['id'],
      username: user['username'],
      email: user['email'],
      rememberMeToken: user['remember_me_token'],
      createdAt: user['created_at'],
      updatedAt: user['updated_at'],
      isDeleted: user['is_deleted'],
      name: user['name'],
      code: user['code'],
      address: user['address'],
      customerCategoryId: user['customer_category_id'],
      sector: user['sector'],
      nif: user['nif'],
      uuid: user['uuid'],
      phone: user['phone'],
      street: user['street'],
      city: user['city'],
      postalCode: user['postal_code'],
      mainUser: user['main_user'],
      mainUserId: user['main_user_id'],
      coreCustomerId: user['core_customer_id'],
      isPasswordChanged: user['is_password_changed'],
      isActive: user['is_active'],
      customerType: user['customer_type'],
      token: userUpdate.token,
      refreshToken: userUpdate.refreshToken,
      expiresAt: userUpdate.expiresAt,
      employee: userUpdate.employee,
    );
  }
  factory UserInformationModel.fromJson(Map<String,dynamic> json){
       Map<String,dynamic> data = json["data"];
       Map<String,dynamic> token = data["token"];
       Map<String,dynamic> user = data["user"];
    return UserInformationModel(
      id: user["id"],
      username: user["username"],
      email: user["email"],
      rememberMeToken: user["remember_me_token"] ?? "",
      createdAt: user["created_at"],
      updatedAt: user["updated_at"],
      name: user["name"] ?? "",
      code: user["code"] ?? "",
      address: user["address"] ?? "",
      customerCategoryId: user["customer_category_id"],
      sector: user["sector"],
      nif: user["nif"],
      uuid: user["uuid"] ?? "",
      phone: user["phone"] ?? "",
      street: user["street"] ?? "",
      city: user["city"] ?? "",
      postalCode: user["postal_code"],
      mainUser: user["main_user"] ?? 1,
      mainUserId: user["main_user_id"],
      employee: user["employee"] ?? "",
      token: token["token"],
      refreshToken: token["refreshToken"],
      expiresAt: token["expires_at"],

    );
  }

  factory UserInformationModel.empty(){
    return UserInformationModel(
      id: 0,
      username: "",
      email: "",
      rememberMeToken: "",
      createdAt: "",
      updatedAt: "",
      name: "",
      code: "",
      address: "",
      customerCategoryId: 0,
      sector: "",
      nif: "",
      uuid: "",
      phone: "",
      street: "",
      city: "",
      postalCode: "",
      mainUser: 1,
      mainUserId: 0,
      employee: "",
      token: "",
      refreshToken: "",
      expiresAt: "",
    );
  }

    static Map<String, dynamic> convert({required UserInformationEntity user}) {
    return {
      "id": user.id,
      "username": user.username,
      "email": user.email,
      "remember_me_token": user.rememberMeToken,
      "created_at": user.createdAt,
      "updated_at": user.updatedAt,
      "name": user.name,
      "code": user.code,
      "address": user.address,
      "customer_category_id": user.customerCategoryId,
      "sector": user.sector,
      "nif": user.nif,
      "uuid": user.uuid,
      "phone": user.phone,
      "street": user.street,
      "city": user.city,
      "postal_code": user.postalCode,
      "main_user": user.mainUser,
      "main_user_id": user.mainUserId,
      "employee": user.employee,
      "token": user.token,
      "expires_at": user.expiresAt,
      "refreshToken": user.refreshToken,
    };
  }

  static Map<String, dynamic> userUpdate({required UserInformationEntity user}) {
    return {
      'id': user.id,
      'username': user.username,
      'email': user.email,
      'remember_me_token': user.rememberMeToken,
      'created_at': user.createdAt,
      'updated_at': user.updatedAt,
      'is_deleted': user.isDeleted,
      'name': user.name,
      'code': user.code,
      'address': user.address,
      'customer_category_id': user.customerCategoryId,
      'sector': user.sector,
      'nif': user.nif,
      'uuid': user.uuid,
      'phone': user.phone,
      'street': user.street,
      'city': user.city,
      'postal_code': user.postalCode,
      'main_user': user.mainUser,
      'main_user_id': user.mainUserId,
      'core_customer_id': user.coreCustomerId,
      'is_password_changed': user.isPasswordChanged,
      'is_active': user.isActive,
      'customer_type': user.customerType,
      "token": user.token,
      "expires_at": user.expiresAt,
      "refreshToken": user.refreshToken,
    };
  }
}
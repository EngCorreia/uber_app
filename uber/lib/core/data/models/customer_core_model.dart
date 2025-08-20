


import '../../domain/entities/customer_core_entity.dart';

class CustomerCoreModel extends CustomerCoreEntity{
  CustomerCoreModel({
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
    required super.coreCustomerId
  });


  factory CustomerCoreModel.fromJson(Map<String, dynamic> json) => CustomerCoreModel(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    rememberMeToken: json["remember_me_token"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    name: json["name"],
    code: json["code"],
    address: json["address"],
    customerCategoryId: json["customer_category_id"],
    sector: json["sector"],
    nif: json["nif"],
    uuid: json["uuid"],
    phone: json["phone"],
    street: json["street"],
    city: json["city"],
    postalCode: json["postal_code"],
    mainUser: json["main_user"],
    mainUserId: json["main_user_id"],
    coreCustomerId: json["core_customer_id"],
  );

}



import '../../../../../core/domain/entities/user_information_entity.dart';

abstract class IAuthenticatedUserDatasource{
  Future<UserInformationEntity> get();
  Future<bool> saveStore(UserInformationEntity user);
  Future<bool> updateStore(UserInformationEntity user);
  Future<bool> remove();
}


abstract class ISystemLocaleDatasource {
  Future<String?> localeCode();
  Future<bool> storeCode(String params);
}
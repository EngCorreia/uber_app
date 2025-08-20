import 'package:local/local.dart';
import 'package:uber/core/data/datasources/system_locale_datasource.dart';


class SystemLocaleDatasourceImplementation implements ISystemLocaleDatasource {
  SystemLocaleDatasourceImplementation(this.local);

  final ILocalStorage local;
  @override
  Future<String?> localeCode() async {
    try {
      final result = await local.get(key: "locale_code");

      if (result != null) {
        return result;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> storeCode(String params) async {
    try {
      final result = await local.put(key: "locale_code", value: params);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}

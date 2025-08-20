import 'dart:io';
import 'dart:ui';
import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import '../../domain/repositories/system_locale_repository.dart';
import '../datasources/system_locale_datasource.dart';

class SystemLocaleRepositoryImplementation implements ISystemLocaleRepository {

  SystemLocaleRepositoryImplementation(this.datasource);
  final ISystemLocaleDatasource datasource;
  @override
  Future<Either<Failure, Locale?>> locale(String? params) async {
    try {
      final String defaultLocale = Platform.localeName;
      final String locale = systemLocale(defaultLocale);


      if (params != null) {
        await datasource.storeCode(params);
        var localeCode = await datasource.localeCode();
        if (localeCode != null) return Right(Locale(localeCode));
        if (localeCode == null) return Right(Locale(locale));
      } else {
        var localeCode = await datasource.localeCode();


        if (localeCode != null) return Right(Locale(localeCode));
        if (localeCode == null) return Right(Locale(locale));
      }
      return  const Left(FetchDataFailure("error"));
    } on Exception catch (e) {
      return Left(FetchDataFailure("$e"));
    }
  }

  String systemLocale(String locale) {
    String localeCode;
    if (locale.contains("_")) {
      List<String> parts = locale.split("_");
      String result = parts[0];
      localeCode = result;
    } else {
      localeCode = locale;
    }
    return localeCode;
  }
}

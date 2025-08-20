

import 'dart:developer';
import 'dart:ui';

import 'package:interfaces/interfaces.dart';

import '../domain/usecases/system_locale_usecase.dart';

class SystemLocaleService {
  SystemLocaleService(this.usecase);

  final SystemLocaleUsecase usecase;
  ApiResponse<Locale> _response = ApiResponse.loading("loading...");

  Locale? _locale;
  Locale? get localeName => _locale;

  Future<ApiResponse<Locale>> locale([String? params]) async {
    final result = await usecase(params);
    _response = result.fold((l) => ApiResponse.error('$l'), (r) {
      _locale = r;
      return ApiResponse.completed(r);
    });
    return _response;
  }
}

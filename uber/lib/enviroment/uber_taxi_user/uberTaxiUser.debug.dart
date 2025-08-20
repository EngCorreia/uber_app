
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../core/services/system_locale_serivce.dart';
import '../../infra/locator.dart';
import '../../views/startup/startup_view.dart';


Future<void> main() async {
  await dotenv.load(fileName: "assets/env/dev/unig4waste.elisal.debug.env").then((value) async {
    setupLocator(dotenv.env['BASE_URL'], enviroment: dotenv.env['ENV']);
    await locator<SystemLocaleService>().locale();
  });
  runApp(const StartupView());
}


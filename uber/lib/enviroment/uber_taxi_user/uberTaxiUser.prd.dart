import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../core/services/system_locale_serivce.dart';
import '../../core/set_up_dialog_ui/set_up_dialog.dart';
import '../../infra/locator.dart';
import '../../views/startup/startup_view.dart';

Future<void> main() async {
  await dotenv.load(fileName: "assets/env/prd/unig4waste.elisal.prd.env").then((value) async {
    setupLocator(dotenv.env['BASE_URL'], enviroment: dotenv.env['ENV']);
    await locator<SystemLocaleService>().locale();
    setupDialogUI();
  });
  runApp(const StartupView());
}
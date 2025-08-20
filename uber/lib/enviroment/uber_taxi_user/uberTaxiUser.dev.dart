import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import '../../core/services/system_locale_serivce.dart';
import '../../core/set_up_dialog_ui/set_up_dialog.dart';
import '../../infra/locator.dart';
import '../../providers/app_state.dart';
import '../../providers/user.dart';
import '../../views/startup/startup_view.dart';

Future<void> main() async {
    await dotenv.load(fileName: "assets/env/dev/uberTaxiUser.dev.env").then((value) async {
    setupLocator(dotenv.env['BASE_URL'], enviroment: dotenv.env['ENV']);
    await locator<SystemLocaleService>().locale();
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    setupDialogUI();
  });
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AppStateProvider>(create: (_) => AppStateProvider()),
          ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider.initialize()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Uber app',
          theme: ThemeData(
              primarySwatch: Colors.red
          ),
          home: const StartupView(),
        ),
      ),

  );
}







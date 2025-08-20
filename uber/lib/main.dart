import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uber/providers/app_state.dart';
import 'package:uber/providers/user.dart';
import 'package:uber/views/home.dart';
import 'package:uber/views/home/home_view.dart';
import 'package:uber/views/login/login_view.dart';
import 'package:uber/views/splash.dart';
import 'locators/service_locator.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppStateProvider>(create: (_) => AppStateProvider()),
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider.initialize()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Txapita',
        theme: ThemeData(
          primarySwatch: Colors.red
        ),
        home: HomeView(),
      ),
    ),
  );
}




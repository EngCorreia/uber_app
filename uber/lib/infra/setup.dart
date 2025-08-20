import 'package:stacked/stacked_annotations.dart';

import '../views/home.dart';
import '../views/home/home_view.dart';
import '../views/registration.dart';
import '../views/splash.dart';



@StackedApp(routes: [
  AdaptiveRoute(page: HomeView),
  AdaptiveRoute(page: MyHomePage),
  AdaptiveRoute(page: RegistrationScreen),
  AdaptiveRoute(page: Splash),

], logger: StackedLogger())
class AppSetup {}

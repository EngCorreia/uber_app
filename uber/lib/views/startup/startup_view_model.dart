import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../core/colors_core/colors_core.dart';
import '../../core/domain/entities/user_information_entity.dart';
import '../../core/services/system_locale_serivce.dart';
import '../../core/utils/enums.dart';
import '../../infra/locator.dart';
import '../../infra/setup.logger.dart';


class StartupViewModel extends BaseViewModel {
  StartupViewModel() {
    log.d('created');
  }

  final log = getLogger('StartupViewModel');
  GlobalKey<NavigatorState>? get globalKey => StackedService.navigatorKey;
  final _systemLocaleService = locator<SystemLocaleService>();
  final _snackbarService = locator<SnackbarService>();


  String get env => dotenv.env['ENV']!;
  String get baseUrl => dotenv.env['BASE_URL']!;
  String get logo => dotenv.env['LOGO_IMAGE']!;


  //------------ locale settings ----------------


  Locale? _locale;
  set(Locale locale) => _locale = locale;
  Locale? get locale => _locale;




  Locale? get defaultLocale => _systemLocaleService.localeName;



  Future setupSnackbarUi() async {
    _snackbarService.registerSnackbarConfig(SnackbarConfig(
        snackStyle: SnackStyle.GROUNDED,
        animationDuration: const Duration(milliseconds: 300),
        messageColor: Colors.white,
        messageTextAlign: TextAlign.center));

    _snackbarService.registerCustomSnackbarConfig(
      variant: SnackbarType.success,
      config: SnackbarConfig(
        duration: const Duration(milliseconds: 3500),
        backgroundColor: primaryGreen,
        snackStyle: SnackStyle.GROUNDED,
        // maxWidth: 350,
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.symmetric(vertical: 30),
        textColor: Colors.white,
        borderRadius: 8,
        messageTextAlign: TextAlign.center,
        snackPosition: SnackPosition.BOTTOM,
        dismissDirection: DismissDirection.vertical,
      ),
    );

    _snackbarService.registerCustomSnackbarConfig(
      variant: SnackbarType.warning,
      config: SnackbarConfig(
        duration: const Duration(milliseconds: 3500),
        backgroundColor: Colors.red,
        textColor: Colors.white,
        snackStyle: SnackStyle.GROUNDED,
        // maxWidth: 350,
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.symmetric(vertical: 20),
        borderRadius: 8,
        messageTextAlign: TextAlign.center,
        snackPosition: SnackPosition.BOTTOM,
        dismissDirection: DismissDirection.vertical,
      ),
    );
    _snackbarService.registerCustomSnackbarConfig(
      variant: SnackbarType.notification,
      config: SnackbarConfig(
        duration: const Duration(seconds: 5),

        shouldIconPulse: true,
        icon: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset("assets/images/logo-azule-2x.png",
              height: 60, width: 60),
        ),
        boxShadows: [
          BoxShadow(
            color: Colors.grey.withAlpha(128),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        backgroundColor: Colors.white,
        textColor: Colors.black,
        snackStyle: SnackStyle.FLOATING,

        // maxWidth: 350,
        borderColor: Colors.grey.withAlpha(128),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        borderRadius: 8,
        messageTextAlign: TextAlign.left,
        snackPosition: SnackPosition.TOP,
        dismissDirection: DismissDirection.horizontal,
      ),
    );

  }

}




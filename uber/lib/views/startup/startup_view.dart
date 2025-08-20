import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../core/fonts_core/fonts_core.dart';
import '../../infra/lifecycle.dart';
import '../../infra/locator.dart';
import '../../infra/setup.router.dart';
import 'startup_view_model.dart';

class StartupView extends StatelessWidget {
  const StartupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      onViewModelReady: (model){
        model.setupSnackbarUi();
      },
      builder: (context, model, child) {
        return LifeCycleManager(
          child: MaterialApp(
            title: 'Unig4waste',
            debugShowCheckedModeBanner: false,
            navigatorKey: model.globalKey,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
              useMaterial3: true,
              textTheme: TextTheme(
                bodyLarge: const TextStyle(fontFamily: FontsCore.inter),
                bodyMedium: TextStyle(fontFamily: FontsCore.inter,fontWeight: FontWeight.w500),
                bodySmall: const TextStyle(fontFamily: FontsCore.inter),
                displayLarge: const TextStyle(fontFamily: FontsCore.inter),
              ),
            ),
            locale: model.locale,
            onGenerateRoute: StackedRouter().onGenerateRoute,
            initialRoute: Routes.homeView,
          ),
        );
      },
      viewModelBuilder: () => locator<StartupViewModel>(),
    );
  }
}

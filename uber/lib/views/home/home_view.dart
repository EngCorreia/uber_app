import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import '../../providers/user.dart';
import '../home.dart';
import '../login/login_view.dart';
import '../splash.dart';
import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    UserProvider auth = Provider.of<UserProvider>(context);
    return ViewModelBuilder<HomeViewModel>.reactive(
        onViewModelReady: (viewModel){

        },
        viewModelBuilder: ()=> HomeViewModel(),
        builder: (context,model, child){
          switch (auth.status) {
            case Status.Uninitialized:
              return Splash();
            case Status.Unauthenticated:
            case Status.Authenticating:
              return LoginScreen();
            case Status.Authenticated:
              return MyHomePage(title: 'uber');
            }
        });
  }

}


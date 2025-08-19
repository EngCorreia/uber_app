import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import '../helpers/screen_navigation.dart';
import '../helpers/style.dart';
import '../providers/app_state.dart';
import '../providers/user.dart';
import '../widgets/custom_text.dart';
import '../widgets/loading.dart';
import 'home.dart';
import 'login.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _key = GlobalKey<ScaffoldState>();

  Future<Position?> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verifica se o serviço de localização está habilitado
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Serviço de localização está desativado.");
    }

    // Verifica se já tem permissão
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Permissão de localização negada.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // O usuário bloqueou permanentemente → só indo nas configurações
      throw Exception("Permissão de localização permanentemente negada. Vá nas configurações do app para ativar.");
    }
    // Se chegou aqui, pode pegar a posição
    return await Geolocator.getCurrentPosition();
  }


  @override
  void initState() {
    super.initState();
    _determinePosition();
  }
  @override
  Widget build(BuildContext context) {
    UserProvider authProvider = Provider.of<UserProvider>(context);
    //AppStateProvider app = Provider.of<AppStateProvider>(context);
    return Scaffold(
      key: _key,
      backgroundColor: Colors.deepOrange,
      body: authProvider.status == Status.Authenticating? Loading() : SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: white,
              height: 100,
            ),

            Container(
              color: white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("images/lg.png", width: 230, height: 120,),
                ],
              ),
            ),

            Container(
              height: 40,
              color: white,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: white),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: authProvider.name,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: white),
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: white),
                        labelText: "Name",
                        hintText: "eg: Santos Enoque",
                        icon: Icon(Icons.person, color: white,)
                    ),
                  ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: white),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: authProvider.email,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: white),
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: white),
                        labelText: "Email",
                        hintText: "santos@enoque.com",
                        icon: Icon(Icons.email, color: white,)
                    ),
                  ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: white),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: authProvider.phone,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: white),
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: white),
                        labelText: "Phone",
                        hintText: "+244 9** *** ***",
                        icon: Icon(Icons.phone, color: white,)
                    ),
                  ),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: white),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: authProvider.password,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: white),
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: white),
                        labelText: "Password",
                        hintText: "at least 6 digits",
                        icon: Icon(Icons.lock, color: white,)
                    ),
                  ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: ()async{
                  if(!await authProvider.signUp()){
                    //TODO
                    //_key.currentState.showSnackBar(SnackBar(content: Text("Registration failed!")));
                    return;
                  }
                  authProvider.clearController();
                  changeScreenReplacement(context, MyHomePage(title: 'uber',));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomText(text: "Register", color: white, size: 22,)
                      ],
                    ),),
                ),
              ),
            ),

            GestureDetector(
              onTap: (){
                changeScreen(context, LoginScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomText(text: "Login here", size: 20,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

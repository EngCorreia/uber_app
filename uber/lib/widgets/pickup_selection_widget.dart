import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
//import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/constants.dart';
import '../helpers/style.dart';
import '../providers/app_state.dart';
import '../providers/user.dart';
import 'custom_text.dart';
import 'locations.dart';

class PickupSelectionWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldState;
  const PickupSelectionWidget({super.key, required this.scaffoldState});

  @override
  State<PickupSelectionWidget> createState() => _PickupSelectionWidgetState();
}

class _PickupSelectionWidgetState extends State<PickupSelectionWidget> {
  TextEditingController controller = TextEditingController();

  /*
  placesAutoCompleteTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GooglePlaceAutoCompleteTextField(
        textEditingController: controller,
        googleAPIKey: GOOGLE_MAPS_API_KEY,
        inputDecoration: InputDecoration(
          hintText: "Search your location",
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
        debounceTime: 400,
        countries: ["ao","br"],
        isLatLngRequired: true,
        getPlaceDetailWithLatLng: (Prediction prediction) {
          print("placeDetails${prediction.lat}");
        },

        itemClick: (Prediction prediction) {
          controller.text = prediction.description ?? "";
          controller.selection = TextSelection.fromPosition(
              TextPosition(offset: prediction.description?.length ?? 0));

        },
        seperatedBuilder: Divider(),
        containerHorizontalPadding: 10,

        // OPTIONAL// If you want to customize list view item builder
        itemBuilder: (context, index, Prediction prediction) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(
                  width: 7,
                ),
                Expanded(child: Text(prediction.description ?? ""))
              ],
            ),
          );
        },

        isCrossBtnShown: true,

        // default 600 ms ,
      ),
    );
  }

  */


  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    AppStateProvider appState = Provider.of<AppStateProvider>(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.28,
      minChildSize: 0.28,
      builder: (BuildContext context, myscrollController) {
        return Container(
          decoration: BoxDecoration(color: white,
//                        borderRadius: BorderRadius.only(
//                            topLeft: Radius.circular(20),
//                            topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(.8),
                    offset: Offset(3, 2),
                    blurRadius: 7)
              ]),
          child: ListView(
            controller: myscrollController,
            children: [
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Move o marcador ate sua locação no mapa",
                    size: 12,
                    weight: FontWeight.w300,
                  ),
                ],
              ),
              Divider(),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Container(
                  color: grey.withOpacity(.3),
                  child: TextField(
                    onTap: () async {
                      SharedPreferences preferences = await SharedPreferences.getInstance();
                      //placesAutoCompleteTextField();

                      GooglePlaceAutoCompleteTextField(
                        textEditingController: controller,
                        googleAPIKey: GOOGLE_MAPS_API_KEY,
                        inputDecoration: InputDecoration(hintText: "Pesquisar local"),
                        debounceTime: 800,
                        getPlaceDetailWithLatLng: (prediction) {
                          print(prediction.lat);
                          print(prediction.lng);
                          double lat = prediction.lat as double;
                          double lng = prediction.lng as double;
                          appState.changeRequestedDestination(reqDestination: prediction.description!, lat: lat, lng: lng);
                          appState.updateDestination(destination: prediction.description!);
                          LatLng coordinates = LatLng(lat, lng);
                          appState.setPickCoordinates(coordinates: coordinates);
                          appState.changePickupLocationAddress(
                              address: prediction.description!);
                        },
                        itemClick: (prediction) {
                          controller.text = prediction.description ?? "";
                        },
                      );
                    },
                    textInputAction: TextInputAction.go,
                    controller: appState.pickupLocationControlelr,
                    cursorColor: Colors.blue.shade900,
                    decoration: InputDecoration(
                      icon: Container(
                        margin: EdgeInsets.only(left: 20, bottom: 15),
                        width: 10,
                        height: 10,
                        child: Icon(
                          Icons.location_on,
                          color: primary,
                        ),
                      ),
                      hintText: "Marcar localização",
                      hintStyle: TextStyle(
                          color: black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      await appState.sendRequest();
                      appState.changeWidgetShowed(showWidget: Show.PAYMENT_METHOD_SELECTION,);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent, // cor de fundo
                      foregroundColor: Colors.white, // cor do texto/ícone
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Confirmar localização",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  )
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

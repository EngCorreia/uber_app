import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/constants.dart';
import '../helpers/style.dart';
import '../providers/app_state.dart';


class DestinationSelectionWidget extends StatelessWidget {
   DestinationSelectionWidget({super.key});
  final GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: "AIzaSyA7DlllUUtkjK7_Gnx16FXkLQW661BL-BA");
  @override
  Widget build(BuildContext context) {
    AppStateProvider appState = Provider.of<AppStateProvider>(context);
    TextEditingController controller = TextEditingController();
    return DraggableScrollableSheet(
      initialChildSize: 0.28,
      minChildSize: 0.28,
      builder: (BuildContext context, myscrollController) {
        return Container(
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(.8),
                    offset: Offset(3, 2),
                    blurRadius: 7)
              ]),
          child: ListView(
            controller: myscrollController,
            children: [
              Icon(
                Icons.remove,
                size: 40,
                color: grey,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: GooglePlaceAutoCompleteTextField(
                  textEditingController: controller,
                  googleAPIKey: GOOGLE_MAPS_API_KEY,
                  inputDecoration: InputDecoration(hintText: "Where to go.."),
                  debounceTime: 800,
                  getPlaceDetailWithLatLng: (prediction) async {
                    log("******************* ${prediction.description}");
                    controller.text = prediction.description ?? "";
                    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(prediction.id!);
                    double lat = prediction.lat as double;
                    double lng = prediction.lng as double;
                    appState.changeRequestedDestination(reqDestination: prediction.description!, lat: lat, lng: lng);
                    appState.updateDestination(destination: prediction.description!);
                    LatLng coordinates = LatLng(lat, lng);
                    appState.setDestination(coordinates: coordinates);
                    appState.addPickupMarker(appState.center);
                    appState.changeWidgetShowed(showWidget: Show.PICKUP_SELECTION);
                    //appState.sendRequest(destination: coordinates);
                  },
                  itemClick: (prediction) async {
                    log("******************* ${prediction.description}");
                    controller.text = prediction.description ?? "";
                    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(prediction.id!);
                    double lat = prediction.lat as double;
                    double lng = prediction.lng as double;
                    appState.changeRequestedDestination(
                        reqDestination: prediction.description!, lat: lat, lng: lng);
                    appState.updateDestination(destination: prediction.description!);
                    LatLng coordinates = LatLng(lat, lng);
                    appState.setDestination(coordinates: coordinates);
                    appState.addPickupMarker(appState.center);
                    appState.changeWidgetShowed(showWidget: Show.PICKUP_SELECTION);
                  },
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.deepOrange[300],
                  child: Icon(
                    Icons.home,
                    color: white,
                  ),
                ),
                title: Text("Home"),
                subtitle: Text("25th avenue, 23 street"),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.deepOrange[300],
                  child: Icon(
                    Icons.work,
                    color: white,
                  ),
                ),
                title: Text("Work"),
                subtitle: Text("25th avenue, 23 street"),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.18),
                  child: Icon(
                    Icons.history,
                    color: primary,
                  ),
                ),
                title: Text("Recent location"),
                subtitle: Text("25th avenue, 23 street"),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(.18),
                  child: Icon(
                    Icons.history,
                    color: primary,
                  ),
                ),
                title: Text("Recent location"),
                subtitle: Text("25th avenue, 23 street"),
              ),
            ],
          ),
        );
      },
    );
  }
}

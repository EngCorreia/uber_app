import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart' as polyline_points;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../providers/user.dart';

const kGoogleApiKey = "AIzaSyA7DlllUUtkjK7_Gnx16FXkLQW661BL-BA";

class PickupSelectionWidget1 extends StatefulWidget {
  const PickupSelectionWidget1({
    super.key,
    required this.currentLocation,
    required this.coords,
    required this.setMarker,
  });

  final LatLng currentLocation;
  final List<LatLng> coords;
  final Function(LatLng?, String?) setMarker;

  @override
  State<PickupSelectionWidget1> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<PickupSelectionWidget1> {
  GoogleMapController? mapController;
  LatLng? _selectedPosition;
  final TextEditingController _searchController = TextEditingController();
  final GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

  final LatLng _companyLocation = const LatLng(-8.8383, 13.2344);
  bool _isLoading = false;
  String _currentAddress = "Carregando endereço...";

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verifica se a localização está ativada
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    // Verifica as permissões
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    // Obtém a posição atual
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high, // Maior precisão
    );

    LatLng currentLatLng = LatLng(position.latitude, position.longitude);

    setState(() {
      _selectedPosition = currentLatLng;
    });

    _getCurrentAddress(currentLatLng);
  }

  Future<void> _getCurrentAddress(LatLng position) async {
    setState(() => _currentAddress = "Obtendo endereço...");

    try {
      final response = await http.get(
        Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?'
            'latlng=${position.latitude},${position.longitude}'
            '&key=$kGoogleApiKey'
            '&language=pt'
            '&region=ao'
            '&result_type=street_address'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == 'OK' && data['results'].isNotEmpty) {
          for (var result in data['results']) {
            if (result['types'].contains('street_address')) {
              setState(() => _currentAddress = result['formatted_address']);
              return;
            }
          }
          setState(() => _currentAddress = data['results'][0]['formatted_address']);
        }
      }
    } catch (e) {
      setState(() => _currentAddress = "Erro ao obter endereço");
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onMapTapped(LatLng position) async {
    setState(() {
      _selectedPosition = position;
      _isLoading = true;
    });

    await _getCurrentAddress(position);

    setState(() {
      _isLoading = false;
    });
  }


 /* void _searchPlaces1(){
    AwesomePlaceSearch(context: context,

      onTap: (value) async {
        var result = await value;

        setState(() {
          var prediction = result;
        });
      }, key: "Your Google Map Key",
    ).show();
  }
  */

  Future<List<Prediction>> _searchPlaces(String query) async {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    AppStateProvider appState = Provider.of<AppStateProvider>(context);
    try {
      PlacesAutocompleteResponse response = await _places.autocomplete(
        query,
        location: Location(lat: -8.8383, lng: 13.2344),
        radius: 50000,
        components: [Component(Component.country, "ao")],
      );
     // PlacesDetailsResponse detail = await places.getDetailsByPlaceId(response.placeId!);
      //double lat = detail.result.geometry!.location.lat;
      //double lng = detail.result.geometry!.location.lng;
      //appState.changeRequestedDestination(reqDestination: response.description!, lat: lat, lng: lng);
      //appState.updateDestination(destination: response.description!);
      //LatLng coordinates = LatLng(lat, lng);
     // appState.setPickCoordinates(coordinates: coordinates);
     // appState.changePickupLocationAddress(address: response.description!);
      return response.predictions;
    } catch (e) {
      return [];
    }
  }

  void _onSuggestionSelected(Prediction prediction) async {
    setState(() => _isLoading = true);

    try {
      PlacesDetailsResponse detail =
      await _places.getDetailsByPlaceId(prediction.placeId!);
      final location = detail.result.geometry!.location;
      final latLng = LatLng(location.lat, location.lng);

      setState(() {
        _selectedPosition = latLng;
        _currentAddress =
            detail.result.formattedAddress ?? prediction.description!;
      });

      mapController?.animateCamera(CameraUpdate.newLatLngZoom(latLng, 15));
      //widget.setMarker(latLng, _currentAddress);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    AppStateProvider appState = Provider.of<AppStateProvider>(context);
    return SafeArea(
      child: Scaffold(

        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: widget.currentLocation,
                      zoom: 15,
                    ),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    onTap: _onMapTapped,
                    markers: {
                      if (_selectedPosition != null)
                        Marker(
                          markerId: const MarkerId("user_location"),
                          position: _selectedPosition!,
                          infoWindow:
                          const InfoWindow(title: "Localização Escolhida"),
                        ),
                      Marker(
                        markerId: const MarkerId("company_location"),
                        position: _companyLocation,
                        infoWindow:
                        const InfoWindow(title: "Shoprite do Palanca"),
                      ),
                      ...widget.coords.map((coord) => Marker(
                        markerId: MarkerId(coord.toString()),
                        position: coord,
                      )),
                    },
                  ),
                ),

                /*
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Container(
                    color: Colors.grey,
                    child: TextField(
                      onTap: () async {
                        SharedPreferences preferences = await SharedPreferences.getInstance();
                        Prediction? p = await PlacesAutocomplete.show(
                            context: context,
                            apiKey: kGoogleApiKey,
                            mode: Mode.overlay, // Mode.fullscreen
                            // language: "pt",
                            components: [
                               Component(Component.country, "ao")
                            ]);
                        PlacesDetailsResponse detail =
                        await places.getDetailsByPlaceId(p!.id!);
                        double lat = detail.result.geometry!.location.lat;
                        double lng = detail.result.geometry!.location.lng;
                        appState.changeRequestedDestination(
                            reqDestination: p.description!, lat: lat, lng: lng);
                        appState.updateDestination(destination: p.description!);
                        LatLng coordinates = LatLng(lat, lng);
                        appState.setPickCoordinates(coordinates: coordinates);
                        appState.changePickupLocationAddress(
                            address: p.description!);
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
                        hintText: "Pick up location",
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
                */
                if (_isLoading)
                  const Center(child: CircularProgressIndicator.adaptive()),
                Positioned(
                  bottom: 40,
                  left: 20,
                  right: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 5)),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Localização atual',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _currentAddress,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue,

                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_selectedPosition != null) {
                                widget.setMarker(_selectedPosition, null);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "OK",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: _selectedPosition != null
                                      ? Colors.blue
                                      : Colors.grey,
                                  height: 1,
                                  fontSize: Platform.isIOS ? 17 : 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 180,
              right: 20,
              child: FloatingActionButton(
                onPressed: _determinePosition,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.my_location,
                  color: Colors.blue,
                  size: 26,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
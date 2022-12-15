import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/services/location_service.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kStartPosition = CameraPosition(
    target: LatLng(50.450001, 30.523333),
    zoom: 6.0,
  );

  List<Marker> cityMarker = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kStartPosition,
        zoomControlsEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set.from(cityMarker),
        onTap: _handleTap,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed:() {
          Navigator.pop(context);
        },
        label: const Text('Back'),
        icon: const Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _handleTap(LatLng tappedPoint) {
    setState(() {
      cityMarker = [];
      LocationService().getPlaceID(tappedPoint);
      cityMarker.add(Marker(
        markerId: MarkerId(tappedPoint.toString()),
        position: tappedPoint
      ));
      var cityName = LocationService().getPlaceID(tappedPoint);
      Navigator.of(context).pop(cityName);
    });
  }
}
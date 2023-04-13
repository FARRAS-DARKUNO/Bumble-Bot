import 'package:bumble_bot/provider/location_bloc/location_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';

class MapApp extends StatefulWidget {
  const MapApp({super.key});

  @override
  State<MapApp> createState() => _MapAppState();
}

class _MapAppState extends State<MapApp> {
  LatLng point = LatLng(0.7893, 113.9213);
  List<Placemark>? location;
  String locationState = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              onTap: (tappotition, latlong) async {
                List<Placemark> alocation = await placemarkFromCoordinates(
                    latlong.latitude, latlong.longitude);

                setState(() {
                  location = alocation;
                  point = LatLng(latlong.latitude, latlong.longitude);
                  locationState =
                      "${location?.first.country},${location?.first.locality}, ${location?.first.subAdministrativeArea}";
                });
              },
              center: LatLng(point.latitude, point.longitude),
              zoom: 5.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: point,
                    builder: (ctx) => const Icon(
                      Icons.location_on,
                      color: Colors.red,
                    ),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 34),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Column(
                  children: <Widget>[
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: location == null
                            ? const Text('...')
                            : Text(locationState),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // print(location)
                        BlocProvider.of<LocationBloc>(context).add(
                          SetLocationEvent(
                            location != null ? locationState : '',
                          ),
                        );
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_qr_maps/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaScreen extends StatefulWidget {
  const MapaScreen({super.key});

  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition puntoInicial =
        CameraPosition(target: scan.getLatLng(), zoom: 17);

    //Marcadores
    Set<Marker> markers = Set<Marker>();
    markers.add(
        Marker(markerId: MarkerId('geo-location'), position: scan.getLatLng()));

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.location_on,
            ),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(target: scan.getLatLng(), zoom: 17)));
            },
          )
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        markers: markers,
        mapType: mapType,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.layers),
        onPressed: () {
          setState(() {
            if (mapType == MapType.normal) {
              mapType = MapType.satellite;
            } else {
              mapType = MapType.normal;
            }
          });
        },
      ),
    );
  }
}

import 'package:campus_mobile_experimental/core/data_providers/maps_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MyLocationButton extends StatelessWidget {
  const MyLocationButton({
    Key key,
    @required GoogleMapController mapController,
  })  : _mapController = mapController,
        super(key: key);

  final GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          child: Icon(
            Icons.my_location,
            color: Colors.white,
          ),
          backgroundColor: Colors.lightBlue,
          onPressed: () {
            _mapController.animateCamera(CameraUpdate.newLatLng(LatLng(
                Provider.of<MapsDataProvider>(context, listen: false)
                    .coordinates
                    .lat,
                Provider.of<MapsDataProvider>(context, listen: false)
                    .coordinates
                    .lon)));
          },
        ),
      ),
    );
  }
}

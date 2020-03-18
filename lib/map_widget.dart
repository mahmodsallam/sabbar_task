import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  static LatLng SOURCE_LOCATION = LatLng(35.3797536, -120.1017334);
  static LatLng DEST_LOCATION = LatLng(35.3997536, -120.1017334);
  static LatLng DRIVER_LOCATION = LatLng(35.4097536, -120.1017334);
  static final CameraPosition _start_camera_position = CameraPosition(
    bearing: 30,
    zoom: 13,
    tilt: 0,
    target: SOURCE_LOCATION,
  );
  Map<String, double> currentLocation;
  Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor sourceLocationIcon;
  BitmapDescriptor driverLocationIcon;
  BitmapDescriptor destinationLocationIcon;
  static final Set<Marker> _markers = {};

  void _setCustomMapMarker() async {
    sourceLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'images/destination_map_marker.png');

    driverLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'images/driving_pin.png');

    destinationLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'images/destination_map_marker.png');
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    setState(() {
      _addMarkers();
      _addDriverMarker(DRIVER_LOCATION) ;
    });
  }

  void _addMarkers() {
    // Pick-up
    _markers.add(Marker(
      markerId: MarkerId(DEST_LOCATION.toString()),
      infoWindow: InfoWindow(
        title: 'pick-up',
        snippet: 'Customer Position ',
      ),
      icon: sourceLocationIcon,
      flat: true,
      anchor: Offset(0.5, 0.5),
      zIndex: 2,
      position: DEST_LOCATION,
    ));

    // Destination marker
    _markers.add(
      Marker(
          markerId: MarkerId(SOURCE_LOCATION.toString()),
          infoWindow: InfoWindow(
            title: 'Destination',
            snippet: 'Deliver Position ',
          ),
          icon: destinationLocationIcon,
          position: SOURCE_LOCATION),
    );

    // Working

  }

  void _addDriverMarker(LatLng driverLocation){
    _markers.add(
      Marker(
          markerId: MarkerId("DRIVER_MARKER"),
          infoWindow: InfoWindow(
            title: 'Driver',
            snippet: 'Driver Position',
          ),
          icon: driverLocationIcon,
          position: DRIVER_LOCATION),
    );

  }

  void _moveDriver(){
    double lat = 35.4097536 ;
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        lat-=0.00055;
        DRIVER_LOCATION = LatLng(lat, -120.1017334);
        _addDriverMarker(DRIVER_LOCATION) ;

      });
      if(lat<=SOURCE_LOCATION.latitude){
        timer.cancel() ;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _moveDriver() ;
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _start_camera_position,
      onMapCreated: _onMapCreated,
      markers: _markers,
    );
  }

  @override
  void initState(){
    _setCustomMapMarker();
  }
}

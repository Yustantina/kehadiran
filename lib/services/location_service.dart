// ignore_for_file: unnecessary_null_comparison, prefer_final_fields, avoid_types_as_parameter_names, non_constant_identifier_names

import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:kehadiran/models/user_location.dart';
import 'package:location/location.dart';

class LocationService {
  LocationService() {
    Permission.location.request().then((PermissionStatus) {
      if (PermissionStatus.isGranted) {
        location.onLocationChanged.listen((LocationData) {
          if (LocationData != null) {
            _locationStreamController.add(UserLocation(
            latitude: LocationData.latitude,
            longitude: LocationData.longitude));
          }
         });
      }
    });
  }

  Location location = Location();

  StreamController<UserLocation> _locationStreamController = StreamController<UserLocation>();

  Stream<UserLocation> get locationStream => _locationStreamController.stream;

  void dispose() => _locationStreamController.close();
}
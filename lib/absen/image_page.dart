// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, annotate_overrides

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:kehadiran/services/location_service.dart';
import 'package:share/share.dart';

class ImagesPage extends StatefulWidget {
  const ImagesPage({Key? key, required String this.filePath}) : super(key: key);

  final filePath;

  @override
  _ImagesPageState createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  String? lokasiFoto, descLokasiFoto;
  bool setLokasi = true;
  double? latitude, longitude;

  LocationService locationService = LocationService();

  @override
  void dispose() {
    super.dispose();
    locationService.dispose();
  }

  getAddressFromLatLng({lat, lang}) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lang);

      Placemark place = placemarks[1];

      // print(longitude);
      // print(latitude);

      // referensi lokasi
      print("administrativeArea: ${place.administrativeArea}");
      print("country: ${place.country}");
      print("isoCountryCode: ${place.isoCountryCode}");
      print("locality: ${place.locality}");
      print("name: ${place.name}");
      print("postalCode: ${place.postalCode}");
      print("street: ${place.street}");
      print("subAdministrativeArea: ${place.subAdministrativeArea}");
      print("subLocality: ${place.subLocality}");
      print("subThoroughfare: ${place.subThoroughfare}");
      print("thoroughfare: ${place.thoroughfare}");

      setState(() {
        lokasiFoto = place.street; // teks gede
        descLokasiFoto =
            "${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.country}"; // teks deskripsi atau gabungan
      });
    } catch (e) {
      // print(e);
    }
  }

  @override
  void initState() {
    super.initState();

    locationService.locationStream.listen((userLocation) {
      if (setLokasi) {
        setState(() {
          latitude = userLocation.latitude;
          longitude = userLocation.longitude;
          setLokasi = false;
        });
      }

      getAddressFromLatLng(lat: latitude, lang: longitude);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.file(
                File(widget.filePath),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(lokasiFoto ?? "",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                  Text(descLokasiFoto ?? "",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                  Text(DateFormat("HH:m MMMM dd, yyyy").format(DateTime.now()),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                ],
              ),
            ),
            /// Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       children: [
            //         GestureDetector(
            //           onTap: () async {},
            //         ),
            //         Container(
            //           child: Icon(
            //             Icons.share,
            //             color: Colors.white,
            //             size: 36,
            //           ),
            //           margin: EdgeInsets.only(top: 4),
            //           width: 60,
            //           height: 60,
            //           decoration: BoxDecoration(
            //             boxShadow: [
            //               BoxShadow(
            //                 color: Colors.grey,
            //                 blurRadius: 3,
            //               )
            //             ],
            //             color: Colors.green,
            //             shape: BoxShape.circle,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

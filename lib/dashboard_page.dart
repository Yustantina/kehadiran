// ignore_for_file: prefer_final_fields, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kehadiran/absen/absen_page.dart';
import 'package:kehadiran/views/profile_page.dart';
import 'package:kehadiran/views/riwayat_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Widget> _pageList = [
    const AbsenPage(),
    const RiwayatPage(),
    const ProfilePage(),
  ];

  int _pageSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _pageList.elementAt(_pageSelected),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageSelected,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (indexSelected) {
          setState(() {
            _pageSelected = indexSelected;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.camera_alt_outlined,
              ),
              label: "Absen"),
          BottomNavigationBarItem(
              icon: Icon(Icons.task_rounded), label: "Riwayat Presensi"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_pin_rounded,
              ),
              label: "Profile")
        ],
      ),
    );
  }
}

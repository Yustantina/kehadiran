// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kehadiran/dashboard_page.dart';
import 'package:kehadiran/views/otp_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF3995DB), Color(0xFF59B9E9), Color(0xFF9BD6F1)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          SizedBox(height: 120),
          Text(
            "Welcome",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w300, color: Colors.white),
          ),
          Text(
            "Sign in to continue",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w100, color: Colors.white),
          ),
          SizedBox(height: 120),
          TextFormField(
            decoration: InputDecoration(
              //  border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue.shade100)),
              prefixIcon: Icon(
                Icons.person,
                size: 30,
              ),
              hintText: "Username",
              hintStyle: TextStyle(color: Colors.black),
              // labelText: "Username",
              // labelStyle: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              //  border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue.shade100)),
              prefixIcon: Icon(
                Icons.lock,
                size: 30,
              ),
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.black),
              // labelText: "Password",
              // labelStyle: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[Color(0xFF141314), Color(0xFF545258)],
                    ),
                    borderRadius: BorderRadius.circular(50.0)),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.white,
                    onTap: () => Get.offAll(DashboardPage()),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 18.0),
                      ),
                    ),
                  ),
                )),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
              child: InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return OtpPage();
              }));
            },
            child: Center(
              child: Text(
                "Create New Account",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ))
        ],
      ),
    ));
  }
}

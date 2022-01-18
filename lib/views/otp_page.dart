import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF3995DB),
          Color(0xFF59B9E9),
          Color(0xFF9BD6F1)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 130,
              ),
              Text(
                "Create New Account",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w100,
                    color: Colors.white),
              ),
              SizedBox(
                height: 100,
              ),
              textField(),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 30,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                    Text(
                      "Enter 4 Digit OTP",
                      style: TextStyle(fontSize: 16, color: Colors.black45),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              otpField(),
            ],
          ),
        ),
      ),
    );
  }

  Widget otpField() {
    return OTPTextField(
      length: 4,
      width: MediaQuery.of(context).size.width - 30,
      fieldWidth: 58,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: Color(0xFF66BB6),
        borderColor: Colors.black,
      ),
      style: TextStyle(fontSize: 16, color: Colors.white),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        print("Completed: " + pin);
      },
    );
  }

  Widget textField() {
    return Container(
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color(0xFFEEEEE), Color(0xFF545258)],
            ),
            borderRadius: BorderRadius.circular(16)),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter your phone Number",
            hintStyle: TextStyle(color: Colors.black45, fontSize: 16),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
              child: Text(
                " (+62)",
                style: TextStyle(color: Colors.black45, fontSize: 16),
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Text(
                " Send ",
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ));
  }
}

import 'package:chat/Screens/homepage.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../constants/color.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({super.key});

  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>(); // Move inside dialog scope
  // Form key for phone number validation

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  String _countryCode = "+91"; // Default country code

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 400,
                width: 600,
                child: Image.asset(
                  'assets/images/chat.png',
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to chat👋',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Enter your phone number to continue'),
                    SizedBox(height: 20),
                    Form(
                      key: _formKey1,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.length != 10) {
                            return "Please enter a valid 10-digit phone number.";
                          }
                          return null;
                        },
                        controller: _phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: CountryCodePicker(
                            onChanged: (value) {
                              setState(() {
                                _countryCode = value.dialCode!;
                              });
                              print('Selected Country Code: $_countryCode');
                            },
                            initialSelection: "IN",
                          ),
                          labelText: 'Enter your number',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent.shade400),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: KprimaryColor,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          if (_formKey1.currentState!.validate()) {
                            // Show OTP Dialog
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Text('OTP Verification'),
                                  content: Form(
                                    key: _formKey2, // Assign to Form widget
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Enter 6-digit OTP'),
                                        SizedBox(height: 10),
                                        TextFormField(
                                          validator: (value) {
                                            if (value == null || value.length != 6) {
                                              return "Invalid OTP";
                                            }
                                            return null;
                                          },
                                          keyboardType: TextInputType.number,
                                          controller: _otpController,
                                          decoration: InputDecoration(
                                            hintText: 'Enter the OTP received',
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide(color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        if (_formKey2.currentState!.validate()) {
                                          Navigator.pushNamed(context, 'HomePage');
                                        }
                                      },
                                      child: Text('Submit'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Text('Send OTP'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

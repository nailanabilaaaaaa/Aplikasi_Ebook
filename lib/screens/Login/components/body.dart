import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:ebook_app/main.dart';
import 'package:ebook_app/providers/AuthProvider.dart';
import 'package:ebook_app/screens/Welcome/welcome_screen.dart';
import 'package:ebook_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:ebook_app/screens/Login/components/background.dart';
import 'package:ebook_app/screens/Signup/signup_screen.dart';
import 'package:ebook_app/components/already_have_an_account_acheck.dart';
import 'package:ebook_app/components/rounded_button.dart';
import 'package:ebook_app/components/rounded_input_field.dart';
import 'package:ebook_app/components/rounded_password_field.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late String deviceName;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    getDeviceName();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Card(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "LOGIN",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: size.height * 0.05),
                SvgPicture.asset(
                  "assets/icons/female.svg",
                  height: size.height * 0.25,
                ),
                SizedBox(height: size.height * 0.05),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (String? value) {
                    // Validation condition
                    if (value!.trim().isEmpty) {
                      return 'Please enter email';
                    }
                  
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: passwordController,
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                  decoration: InputDecoration(labelText: 'Password'),
                  validator: (String? value) {
                    // Validation condition
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    }
                  
                    return null;
                  },
                ),
                RoundedButton(
                  text: "LOGIN",
                  press: () => submit(),
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> submit() async {
    final form = _formKey.currentState;

    if (!form!.validate()) {
      return;
    }

    final AuthProvider provider =
        Provider.of<AuthProvider>(context, listen: false);
    try {
      await provider.login(
          emailController.text, passwordController.text, deviceName);
    } catch (Exception) {
      setState(() {
        errorMessage = Exception.toString().replaceAll('Exception: ', '');
      });
    }
  }

  Future<void> getDeviceName() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        setState(() {
          deviceName = build.model;
        });
      } else if (Platform.isIOS) {
        var build = await deviceInfoPlugin.iosInfo;
        setState(() {
          deviceName = build.model;
        });
      }
    } on PlatformException {
      setState(() {
        deviceName = 'Failed to get platform version';
      });
    }
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:ebook_app/main.dart';
import 'package:ebook_app/screens/Welcome/welcome_screen.dart';
import 'package:ebook_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:ebook_app/screens/User/components/background.dart';
import 'package:ebook_app/components/already_have_an_account_acheck.dart';
import 'package:ebook_app/components/rounded_button.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "PROFIL USER",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/female.svg",
              height: size.height * 0.25,
            ),
            
            RoundedButton(
              text: "LOGOUT",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()));
              },
            ),
            
          ],
        ),
      ),
    );
  }
}

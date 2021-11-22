// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ebook_app/consttans.dart';
import 'package:ebook_app/screens/home_screen.dart';
import 'package:ebook_app/widgets/rounded_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(
              displayColor: kBlackColor,
            ),
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Bitmap.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.headline4,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  TextSpan(
                    text: "Aplikasi",
                  ),
                  TextSpan(
                    text: " Edukasi.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * .6,
                child: RoundedButton(
                  text: 'Start Reading',
                  fontSize: 20,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}

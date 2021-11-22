// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ebook_app/consttans.dart';

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
      title: 'Ebook App',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.headline4,
                children: [
                  TextSpan(
                    text: "Ebook", 
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: " App.",
                  ),
                ],
              ),
            ) ,
            RoundedButton(),
          ],
        ),
      )
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final double verticalPadding;
  final double fontSize;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.verticalPadding = 16,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 15),
              blurRadius: 30,
              color: Color(0xFF666666).withOpacity(.11),
            ),
          ],
        ),
        child: Text(
          "Start Reading", 
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
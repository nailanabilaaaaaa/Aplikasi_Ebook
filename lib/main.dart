// ignore_for_file: prefer_const_constructors

import 'package:ebook_app/screens/Login/login_screen.dart';
import 'package:ebook_app/screens/Signup/signup_screen.dart';
import 'package:ebook_app/screens/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:ebook_app/consttans.dart';
import 'package:ebook_app/screens/home_screen.dart';
import 'package:ebook_app/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

import 'providers/AuthProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:[
      ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EBook App',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: Theme.of(context).textTheme.apply(
                displayColor: kBlackColor,
              ),
        ),
        home: WelcomeScreen(),
        routes: {
          '/login': (context)=> LoginScreen(),
          '/signup': (context)=> SignUpScreen(),
          '/welcomescreen': (context)=>WelcomeScreen(),
        },
      ),
    );
  }
}
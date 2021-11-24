// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:ebook_app/widgets/book_rating.dart';
import 'package:ebook_app/widgets/reading_card_list.dart';
import 'package:ebook_app/widgets/two_side_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:ebook_app/consttans.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Home.png'),
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: size.height * .1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline4,
                  children: [
                    TextSpan(text: "What are you \nreading"),
                    TextSpan(
                      text: ' Today?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  ReadingListCard(
                    image: "assets/images/book-1.png",
                    title: "Crushing & Influence",
                    auth: "Gary Venchuk",
                    rating: 4.9, 
                    pressDetails: () {  }, 
                    pressRead: () {  },
                  ),
                  ReadingListCard(
                    image: "assets/images/book-2.png",
                    title: "Top Ten Business Hacks",
                    auth: "Herman Joel",
                    rating: 4.8, 
                    pressDetails: () {  }, 
                    pressRead: () {  },
                  ),
                  SizedBox(width: 30),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headline4,
                      children: [TextSpan(text: "Best of the")],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
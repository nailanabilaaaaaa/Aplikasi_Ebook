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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headline4,
                      children: [TextSpan(text: "Best of the "),
                      TextSpan(
                        text: "day", style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    height: 205,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 24, 
                              top: 24, 
                              right: size.width * .35,
                            ),
                            height: 185,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFEAEAEA).withOpacity(.45),
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "New York Time Best For 11th March 2020",
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: kLightBlackColor,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "How To Win \nFriends & Influence",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  "Gary Venchuk", 
                                  style: TextStyle(color: kLightBlackColor),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: <Widget>[
                                    BookRating(score: 4.9),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        "When the earth was flat and everyone wanted to win the game of the best and people...",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: kLightBlackColor,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Image.asset(
                            "assets/images/book-3.png", 
                            width: size.width * .37,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: SizedBox(
                            height: 40,
                            width: size.width * .3,
                            child: TwoSideRoundedButton(
                              text: "Read",
                              radious: 24,
                              press: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
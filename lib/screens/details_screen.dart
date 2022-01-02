// ignore_for_file: prefer_const_constructors

import 'package:ebook_app/consttans.dart';
import 'package:ebook_app/widgets/book_rating.dart';
import 'package:ebook_app/widgets/rounded_button.dart';
import 'package:ebook_app/screens/read_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: size.height * .12, left: size.width * .1, right: size.width * .02),
                  height: size.height * .48,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Background.png"),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: BookInfo(size: size,)
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * .48 - 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      ChapterCard(
                        name: "Money",
                        chapterNumber: 1,
                        tag: "Life is about change",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ReadScreen();
                              },
                            ),
                          );
                        },
                      ),
                      ChapterCard(
                        name: "Power",
                        chapterNumber: 2,
                        tag: "Everyting loves power",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ReadScreen();
                              },
                            ),
                          );
                        },
                      ),
                      ChapterCard(
                        name: "Influencer",
                        chapterNumber: 3,
                        tag: "Influencer easily like never befor",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ReadScreen();
                              },
                            ),
                          );
                        },
                      ),
                      ChapterCard(
                        name: "Win",
                        chapterNumber: 4,
                        tag: "Winning is what matters",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ReadScreen();
                              },
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
            
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class ChapterCard extends StatelessWidget {
  final String name;
  final String tag;
  final int chapterNumber;
  final Function() press;
  const ChapterCard({
    Key? key, 
    required this.name, 
    required this.tag, 
    required this.chapterNumber, 
    required this.press,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      margin: EdgeInsets.only(bottom: 16),
      width: size.width - 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(38.5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 33,
            color: Color(0xFFD3D3D3).withOpacity(.84),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                TextSpan(
                  text: "Chapter $chapterNumber : $name \n",
                  style: TextStyle(
                    fontSize: 16,
                    color: kBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: tag, 
                  style: TextStyle(color: kLightBlackColor),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios, 
              size: 18,
            ), 
            onPressed: press,
          )
        ],
      ),
    );
  }
}

class BookInfo extends StatelessWidget {
  const BookInfo({
    Key? key, required Size size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Crushing &",
                style:
                    Theme.of(context).textTheme.headline4,
              ),
              Text(
                "Influence",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        Text(
                          "Ini untuk deskripsi buku",
                          maxLines: 5,
                          style: TextStyle(
                            fontSize: 12,
                            color: kLightBlackColor,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RoundedButton(text: "Read", fontSize: 12,verticalPadding: 10, press: (){
                          return ReadScreen();
                        }),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border),
                      ),
                      BookRating(score: 4.9)
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Image.asset(
          "assets/images/book-1.png",
          height: 200,
        ),
      ],
    );
  }
}

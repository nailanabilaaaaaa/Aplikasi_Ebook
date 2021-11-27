// ignore_for_file: prefer_const_constructors

import 'package:ebook_app/consttans.dart';
import 'package:ebook_app/widgets/book_rating.dart';
import 'package:ebook_app/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  height: size.height * .4,
                  width: double.infinity,
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: size.height * .1,
                        ),
                        Row(
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
                                  Row(
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
                                            RoundedButton(text: "Read", fontSize: 12,verticalPadding: 10, press: (){}),
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
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

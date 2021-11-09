import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class Marketplace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/mintingBackground.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.shop,
                  ),
                  Text(
                    "Marketplace",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Accessories",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 160,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      separatorBuilder: (context, _) => SizedBox(
                        width: 12,
                      ),
                      itemBuilder: (context, index) => buildCard(),
                    ),
                  ),
                  Text(
                    "Health",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 160,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      separatorBuilder: (context, _) => SizedBox(
                        width: 12,
                      ),
                      itemBuilder: (context, index) => buildCard(),
                    ),
                  ),
                  Text(
                    "Power-Ups",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 160,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      separatorBuilder: (context, _) => SizedBox(
                        width: 12,
                      ),
                      itemBuilder: (context, index) => buildCard(),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

Widget buildCard() => Container(
      width: 145,
      height: 160,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 110,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/images/pylonsLogo.png",
                                height: 18,
                                width: 10,
                                alignment: Alignment.bottomLeft,
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "10",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

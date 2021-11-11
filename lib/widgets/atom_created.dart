import 'dart:js';

import 'package:atomgachi_flutter/widgets/my_atoms.dart';
import 'package:flutter/material.dart';

class AtomAttributesPage extends StatefulWidget {
  const AtomAttributesPage({Key? key}) : super(key: key);

  @override
  _AtomAttributesPageState createState() => _AtomAttributesPageState();
}

class _AtomAttributesPageState extends State<AtomAttributesPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller = TabController(length: 2, vsync: this);

  final List<String> healthInfoNames = [
    "Stamina",
    "Strength",
    "Hunger",
    "Rarity"
  ];

  void initState() {
    _controller = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/mintingBackground.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              IconButton(
                padding: EdgeInsets.fromLTRB(0, 0, 350, 0),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyAtomsHomePage()));
                },
                alignment: Alignment.topLeft,
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.white,
              ),
              Column(
                children: [
                  Center(
                    child: Container(
                      height: 400,
                      child: Image.asset(
                        "assets/images/avatar.png",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 7, 0),
                        height: 50,
                        width: 240,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                          ),
                        ),
                        child: Text("AtomGachi#1027",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF647488),
                                fontWeight: FontWeight.w700,
                                fontSize: 20)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        /*const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 42),
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color(0xFF475569),
                    offset: Offset(0, 4),
                    blurRadius: 10)
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(children: [
                        TabBar(
                          indicatorColor: Colors.black,
                          labelColor: Colors.black,
                          controller: _controller,
                          tabs: const [
                            Tab(
                              text: 'Health',
                            ),
                            Tab(
                              text: 'Attributes',
                            ),
                          ],
                        ),
                         SizedBox(
                          height: 200,
                          child: TabBarView(
                            controller: _controller,
                            children: <Widget>[
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 40, right: 27),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: healthInfoNames.length,
                                    itemBuilder: (context, index) => healthInfo(
                                        context, healthInfoNames[index]),
                                  )),
                              Container(
                                child: attributesInfo(context),
                              ),
                            ],
                          ),
                        ), */
      ),
    );
  }
}
/* 
Widget healthInfo(BuildContext context, String title) {
  return Padding(
    padding: const EdgeInsets.only(top: 42.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 14, color: const Color(0xFF334155))),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 16,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFFFF0000),
                Colors.orange,
                Color(0xFFFFD40B),
                Color(0xFFFFED0D),
                Color(0xFFFDED0D),
                Color(0xFF24FB01),
                Color(0xFF24FB01)
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget attributesInfo(BuildContext context) {
  final colorInfo = ["skin:", "eyes:", "hair:", "nose:", "mouth:"];
  final healthInfo = ["strength:", "stamina:", "hunger:", "rarity:"];
  return Padding(
    padding: const EdgeInsets.fromLTRB(23, 19, 23, 24.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("type:", style: Theme.of(context).textTheme.bodyText1),
            Text(" bunni", style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("colors:", style: Theme.of(context).textTheme.bodyText1),
            Container(
              height: 100,
              margin: const EdgeInsets.only(left: 18),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: colorInfo.length,
                  itemBuilder: (context, index) => Text(colorInfo[index],
                      style: Theme.of(context).textTheme.bodyText1)),
            )
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("accessories:", style: Theme.of(context).textTheme.bodyText1),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("glasses:",
                      style: Theme.of(context).textTheme.bodyText1),
                  Text(" false", style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("hair:", style: Theme.of(context).textTheme.bodyText1),
                  Text(" false", style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("health:", style: Theme.of(context).textTheme.bodyText1),
            Container(
              height: 100,
              margin: const EdgeInsets.only(left: 18),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: healthInfo.length,
                  itemBuilder: (context, index) => Text(healthInfo[index],
                      style: Theme.of(context).textTheme.bodyText1)),
            )
          ],
        ),
      ],
    ),
  );
} */
/*  
Widget healthStatus() {
  return Column(
    children: [
      Text("Stamina"),
      LinearProgressIndicator(
          width: 180.0,
          lineHeight: 20,
          percent: 60 / 100,
          progressColor: Colors.orange),
      Text("Strength"),
      LinearPercentIndicator(
          width: 180.0,
          lineHeight: 20,
          percent: 60 / 100,
          progressColor: Colors.red),
      Text("Hunger"),
      LinearPercentIndicator(
          width: 180.0,
          lineHeight: 20,
          percent: 60 / 100,
          progressColor: Colors.yellow),
      Text("Rarity"),
      LinearPercentIndicator(
          width: 180.0,
          lineHeight: 20,
          percent: 60 / 100,
          progressColor: Colors.green),
    ],
  );
} */
 
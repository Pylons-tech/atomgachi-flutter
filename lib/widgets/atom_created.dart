import 'package:atomgachi_flutter/main.dart';
import 'package:flutter/material.dart';

class AtomAttributesPage extends StatefulWidget {
  const AtomAttributesPage({Key? key}) : super(key: key);

  @override
  _AtomAttributesPageState createState() => _AtomAttributesPageState();
}

class _AtomAttributesPageState extends State<AtomAttributesPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller = TabController(length: 2, vsync: this);

  void initState() {
    _controller = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 8,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Column(children: [
                  TabBar(
                    indicatorColor: Colors.black,
                    labelColor: Colors.black,
                    controller: _controller,
                    tabs: [
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
                        Container(),
                        Container(),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
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

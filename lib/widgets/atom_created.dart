import 'package:atomgachi_flutter/main.dart';
import 'package:flutter/material.dart';

class AtomAttributesPage extends StatelessWidget {
  const AtomAttributesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          children: <Widget>[
            Text("picture here"),
            Text("attributes"),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ),
                  );
                },
                icon: Icon(Icons.close),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

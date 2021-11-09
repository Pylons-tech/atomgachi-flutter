import 'package:flutter/material.dart';

class AtomgachiAttributeScreen extends StatelessWidget {
  const AtomgachiAttributeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.add_a_photo),
              title: Text("Atomgachi Here"),
              subtitle: Text('name'),
            )
          ],
        ),
      ),
    );
  }
}

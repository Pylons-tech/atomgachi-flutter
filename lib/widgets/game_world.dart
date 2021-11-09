import 'package:flutter/material.dart';

class GameWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/gameBackground.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

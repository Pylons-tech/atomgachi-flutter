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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(132, 52, 124, 100)),
            onPressed: () {},
            child: Text("PLAY"),
          ),
        ],
      ),
    );
  }
}

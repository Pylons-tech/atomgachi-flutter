import 'package:flutter/material.dart';

class AtomgachiAttributeScreen extends StatelessWidget {
  const AtomgachiAttributeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Container(
            width: 100,
            height: 50,
            child: Row(
              children: [
                Image.asset(
                  "assets/images/avatar.png",
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: const Center(
                    child: Text("AtomGachi#1027",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFF647488),
                            fontWeight: FontWeight.w700,
                            fontSize: 15)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

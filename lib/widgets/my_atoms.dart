import 'package:flutter/material.dart';

class MyAtomsHomePage extends StatefulWidget {
  const MyAtomsHomePage({Key? key}) : super(key: key);

  @override
  _MyAtomsHomePageState createState() => _MyAtomsHomePageState();
}

class _MyAtomsHomePageState extends State<MyAtomsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/myAtomsBackground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                IconButton(
                  splashColor: Colors.grey,
                  alignment: Alignment.bottomRight,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "AtomGachi",
                          style: TextStyle(fontSize: 30),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(132, 54, 124, 100),
                            elevation: 10,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
                            child: Text(
                              "Mint",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/images/pylonsAvatar.png",
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 10.0, 0, 3.0),
                  child: Text(
                    "My Atoms",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Card(
                      elevation: 6,
                      child: SingleChildScrollView(
                        child: Text("Atom List Widget needs to go here"),
                      ),
                    ),
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

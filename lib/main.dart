import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:atomgachi_flutter/widgets/purchase_atom.dart';
import 'package:atomgachi_flutter/widgets/marketplace.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:pylons_flutter/pylons_flutter.dart';
import 'package:fixnum/fixnum.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  PylonsWallet.setup(mode: PylonsMode.prod, host: 'atomgachi');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String? deviceId = "noDeviceId";
  bool walletConnection = false;

  void _createAtomgachiCookbook() async {
    var cb = Cookbook(
        creator: "",
        iD: "atomgachi",
        nodeVersion: "v0.0.1",
        name: "Atomgachi",
        description: "This is the Pylons app inspired by Wagmigotchi!",
        developer: "mijolae",
        version: "v0.0.1",
        supportEmail: "mijolae.wright@pylons.tech",
        costPerBlock: Coin(denom: "upylon", amount: "0"),
        enabled: true);

    var response = await PylonsWallet.instance.txCreateCookbook(cb);
    print('From App $response');
  }

  @override
  void initState() {
    super.initState();
    PylonsWallet.instance.exists().then((value) {
      walletConnection = value;
      print('WALLET Existence $value');
    });
  }

  @override
  Widget build(BuildContext context) {
    retrieveDeviceId();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/introBackground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Atomgachi",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 80,
                  fontFamily: "JellyBelly",
                  letterSpacing: 3,
                  color: Color.fromRGBO(248, 250, 252, 10),
                ),
              ),
              _buildStartButton(walletConnection)
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // Unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // Unique ID on Android
    }
  }

  void retrieveDeviceId() async {
    deviceId = await _getId();
  }

  Widget _buildStartButton(bool _walletConnection) {
    final Future<bool> _walletConnection = Future.delayed(
      const Duration(seconds: 3),
      () => walletConnection,
    );
    return FutureBuilder(
        future: _walletConnection,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          List<Widget> children;
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            children = <Widget>[
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Start",
                  style: TextStyle(fontFamily: "JellyBelly"),
                ),
              ),
            ];
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasError) {
            children = <Widget>[
              ElevatedButton(
                onPressed: () {},
                child: const Text("Connect"),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
                width: 80,
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Retrieving Data',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        });
  }
}

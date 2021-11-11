import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:atomgachi_flutter/config/theme.dart';
import 'package:atomgachi_flutter/widgets/atom_created.dart';
import 'package:atomgachi_flutter/widgets/home.dart';
import 'package:atomgachi_flutter/widgets/my_atoms.dart';
import 'package:atomgachi_flutter/widgets/marketplace.dart';
import 'package:atomgachi_flutter/widgets/processing_mint.dart';
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
      theme: kTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String? deviceId = "noDeviceId";
  bool walletConnection = false;
  bool cookbookCreated = false;

  void _createAtomgachiCookbook() async {
    var cb = Cookbook(
        creator: "",
        iD: "atomgatchiDemo",
        nodeVersion: "v0.0.1",
        name: "Atomgatchi Demo",
        description: "This is the Pylons app inspired by Wagmigotchi!",
        developer: "mijolae",
        version: "v0.0.2",
        supportEmail: "mijolae.wright@pylons.tech",
        costPerBlock: Coin(denom: "upylon", amount: "0"),
        enabled: true);

    var response = await PylonsWallet.instance.txCreateCookbook(cb);
    print('From App $response');
    if (response.success) {
      _createAtomgachiRecipe();
    }
  }

  void _createAtomgachiRecipe() async {
    var rcp = Recipe(
        cookbookID: "atomgatchiDemo",
        iD: "atomgatchiDemoCreate",
        nodeVersion: "v0.0.1",
        name: "AtomgatchiCreation",
        description: "mijollae is testing the demo process",
        version: "v0.0.1",
        coinInputs: [],
        itemInputs: [],
        entries: EntriesList(
          coinOutputs: [],
          itemOutputs: [
            ItemOutput(
              iD: "atomgachiDemoCreate",
              doubles: [],
              longs: [],
              strings: [],
              mutableStrings: [],
              transferFee: [],
              tradePercentage: DecString.decStringFromDouble(0.1),
              tradeable: true,
            ),
          ],
          itemModifyOutputs: [],
        ),
        outputs: [
          WeightedOutputs(
              entryIDs: ["atomgachiDemoCreate"],
              weight: Int64(
                  1)) /*needed " import 'package:fixnum/fixnum.dart' " here;*/
        ],
        blockInterval: Int64(0),
        enabled: true,
        extraInfo: "extraInfo");

    var response = await PylonsWallet.instance.txCreateRecipe(rcp);
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

    if (!cookbookCreated) {
      _createAtomgachiCookbook(); //should occur only ONCE
    }
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
              const FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  "Atomgatchi",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: "JellyBelly",
                    letterSpacing: 3,
                    color: Color.fromRGBO(248, 250, 252, 10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _buildStartButton(walletConnection),
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
              snapshot.hasData &&
              snapshot.data == true) {
            cookbookCreated = true;
            children = <Widget>[
              Container(
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(132, 54, 124, 100),
                    ),
                  ),
                  child: const Text("Start",
                      style: TextStyle(
                          fontFamily: "JellyBelly",
                          fontSize: 40,
                          color: Colors.white)),
                ),
              ),
            ];
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData &&
              snapshot.data == false) {
            children = <Widget>[
              Container(
                height: 70,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                      "Connect to the Pylons Wallet to access Atomgatchi"),
                ),
              ),
            ];
          } else {
            children = <Widget>[
              Container(
                height: 70,
                child: Column(
                  children: const <Widget>[
                    SizedBox(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                      width: 30,
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Retrieving Wallet Information',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
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

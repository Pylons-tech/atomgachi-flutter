import 'package:atomgachi_flutter/widgets/atom_created.dart';
import 'package:flutter/material.dart';
import 'package:pylons_flutter/pylons_flutter.dart';
import 'package:uuid/uuid.dart';

class ProcessingMint extends StatefulWidget {
  String? deviceId;
  ProcessingMint(this.deviceId);

  @override
  _ProcessingMintState createState() => _ProcessingMintState();
}

class _ProcessingMintState extends State<ProcessingMint> {
  Future<bool> creationResponse = Future<bool>.value(false);
  String? deviceId;

  Future<bool> executeRecipe() async {
    //attaches your wallet address as the owner and creator

    /*
      flutter: {creator: pylo1l4s5t8g8y0rus0eayjj2z265xu3zu6yjp9wqru, cookbookID: atomgachi, recipeID: testAtomgachi2, coinInputsIndex: 0}
      flutter: SDKIPCResponse{success: true, errorCode: , error: , data: C8CB3B8CBCF535F5BEBAB734A9D9A8B82C6A4936867A8ED683ED03F12E5922DD, sender: pylons-atomgachi, action: txExecuteRecipe}
      flutter: From App SDKIPCResponse{success: true, errorCode: , error: , data: C8CB3B8CBCF535F5BEBAB734A9D9A8B82C6A4936867A8ED683ED03F12E5922DD, action: txExecuteRecipe}
    */
    var response = await PylonsWallet.instance.txExecuteRecipe(
        cookbookId: 'atomgachi',
        recipeName: "atomgachiDevCreate",
        coinInputIndex: 0,
        itemIds: [],
        paymentInfo: []);

    print('From App $response');
    creationResponse = Future<bool>.value(response.success);
    return creationResponse;
  }

  @override
  Widget build(BuildContext context) {
    var uuid = Uuid();
    String createdAtomId =
        "atomgachi${deviceId}${uuid.v1()}".replaceAll("-", "");

    return Scaffold(
      extendBody: true,
      body: FutureBuilder<bool>(
        future: executeRecipe(),
        builder: (BuildContext context, snapshot) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/mintingBackground.png"),
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      alignment: Alignment.topLeft,
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                    ),
                    if (snapshot.hasError ||
                        (snapshot.hasData &&
                            snapshot.connectionState == ConnectionState.done &&
                            snapshot.data == false))
                      recipeHasError(),
                    if (snapshot.hasData &&
                        snapshot.connectionState == ConnectionState.done &&
                        snapshot.data == true)
                      recipeSuccessful(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget waitingOnResponse() {
  return Column(
    children: [
      Image.asset("assets/images/sampleAtomgachi.png"),
      const Text(
        "Minting...",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

Widget recipeHasError() {
  return Column(
    children: [
      SizedBox(
        height: 60,
      ),
      Image.asset("assets/images/sampleAtomgachiError.png"),
      const Text(
        "Oh No!",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      const Text(
        "Something went wrong on the backend. Check your wallet!",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 7,
            primary: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: Text(
            "Go To Wallet",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget recipeSuccessful() {
  return const AtomAttributesPage();
}

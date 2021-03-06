import 'dart:ffi';
import 'package:uuid/uuid.dart';

import 'package:atomgachi_flutter/widgets/atom_created.dart';
import 'package:flutter/material.dart';
import 'package:pylons_flutter/pylons_flutter.dart';
import 'package:fixnum/fixnum.dart';

class PurchaseNewAtomgachi extends StatelessWidget {
  late bool creationResponse = true;
  String? deviceId;

  PurchaseNewAtomgachi(this.deviceId, {Key? key}) : super(key: key);

  void _createAtomgachiRecipe(String createdAtomId) async {
    var rcp = Recipe(
        cookbookID: "atomgachi",
        iD: createdAtomId,
        nodeVersion: "v0.0.1",
        name: "Atom with it's Number here",
        description: "mijollae is testing the demo process",
        version: "v0.0.1",
        coinInputs: [],
        itemInputs: [],
        entries: EntriesList(
          coinOutputs: [],
          itemOutputs: [
            ItemOutput(
              iD: createdAtomId,
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
              entryIDs: [createdAtomId],
              weight: Int64(
                  1)) /*needed " import 'package:fixnum/fixnum.dart' " here;*/
        ],
        blockInterval: Int64(0),
        enabled: true,
        extraInfo: "extraInfo");

    var response = await PylonsWallet.instance.txCreateRecipe(rcp);

    print('From App $response');
    if (response.success) {
      executeRecipe(createdAtomId);
    }
  }

  void executeRecipe(String createdAtomId) async {
    //attaches your wallet address as the owner and creator
    var response = await PylonsWallet.instance.txExecuteRecipe(
        cookbookId: 'atomgachi',
        recipeName: createdAtomId,
        coinInputIndex: 0,
        itemIds: [],
        paymentInfo: []);

    print('From App $response');
    creationResponse = response.success;
  }

  @override
  Widget build(BuildContext context) {
    var uuid = Uuid();
    String createdAtomId =
        "atomgachi${deviceId}${uuid.v1()}".replaceAll("-", "");

    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _createAtomgachiRecipe(createdAtomId);
              creationResponse
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AtomAttributesPage()))
                  : print("Creation canceled");
            },
            child: Text("Create Atomgachi"),
          ),
          /*put creation failed pop up here*/
        ],
      ),
    );
  }
}

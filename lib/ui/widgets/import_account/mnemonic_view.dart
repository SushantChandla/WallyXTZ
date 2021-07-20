import 'package:flutter/material.dart';
import 'package:tezos_wallet/state_management/appstate.dart';
import 'package:tezster_dart_web/tezster_dart.dart';

class MnemonicView extends StatefulWidget {
  const MnemonicView({Key key, this.afterImport}) : super(key: key);
  final Function afterImport;
  @override
  _MnemonicViewState createState() => _MnemonicViewState();
}

class _MnemonicViewState extends State<MnemonicView> {
  String password = '';
  TextEditingController mneomics = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Seed phrase',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text('Mnemonic. Your secret twelve word phrase.'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              controller: mneomics,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),

          Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              mneomics.text= TezsterDart.generateMnemonic();
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.deepPurple[400])),
                          child: Row(
                            children: [
                              Icon(Icons.create),
                              SizedBox(
                                width: 20,
                              ),
                              Text('Generate Mnemonic'),
                            ],
                          )),
                    ],
                  ),
          SizedBox(height: 20),
          Text(
            'Password',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
              'Used for additional mnemonic derivation. That is NOT a wallet password. (Optional)'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
              onChanged: (key) => password = key,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () async {
                AppState.instance.showProgress();
                try {
                  List<String> keys =
                      await TezsterDart.getKeysFromMnemonicAndPassphrase(
                          mnemonic: mneomics.text, passphrase: password);
                  if (keys.length != 3) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Something went Wrong')));
                    return;
                  }
                  AppState.instance.addAccount(keys);
                } catch (e) {
                  print(e);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Something went Wrong')));
                  return;
                }
                AppState.instance.dismissprogress();
                widget.afterImport();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.deepPurple)))),
              child: Text('Import account'))
        ],
      ),
    );
  }
}

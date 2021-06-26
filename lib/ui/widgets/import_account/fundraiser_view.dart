import 'package:flutter/material.dart';
import 'package:tezos_wallet/state_management/appstate.dart';
import 'package:tezster_dart/tezster_dart.dart';

class FundraiserView extends StatefulWidget {
  const FundraiserView({Key key, this.afterImport}) : super(key: key);
  final Function afterImport;
  @override
  _FundraiserViewState createState() => _FundraiserViewState();
}

class _FundraiserViewState extends State<FundraiserView> {
  @override
  Widget build(BuildContext context) {
    String mneomics = '', password = '', email = '';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Email',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
              onChanged: (key) => email = key,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Password',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
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
          Text(
            'Seed phrase',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text('Mnemonic. Your secret twelve word phrase.'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
              onChanged: (key) => mneomics = key,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () async {
                try {
                  List<String> keys =
                      await TezsterDart.unlockFundraiserIdentity(
                          email: email,
                          passphrase: password,
                          mnemonic: mneomics);
                  if (keys.length != 3) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Something went Wrong')));
                    return;
                  }
                  AppState.instance.addAccount(keys);

                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Something went Wrong')));
                  return;
                }

                widget.afterImport();
              },
              child: Text('Import account'))
        ],
      ),
    );
  }
}

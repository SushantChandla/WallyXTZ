import 'package:flutter/material.dart';
import 'package:tezster_dart/tezster_dart.dart';

class PrivateKey extends StatefulWidget {
  const PrivateKey({Key key, this.afterImport}) : super(key: key);
  final Function afterImport;
  @override
  _PrivateKeyState createState() => _PrivateKeyState();
}

class _PrivateKeyState extends State<PrivateKey> {
  String privateKey = '', forgedOperation = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Private key',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text('The Secret key of the Account you want to import.'),
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
              onChanged: (key) => privateKey = key,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Forged Operation',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          // Text('The Secret key of the Account you want to import.'),
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
              onChanged: (key) => forgedOperation = key,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () async {
                try {
                  List<String> keys = await TezsterDart.signOperationGroup(
                      privateKey: privateKey, forgedOperation: forgedOperation);
                  if (keys.length != 2) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Something went Wrong')));
                    return;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Under Construction')));
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

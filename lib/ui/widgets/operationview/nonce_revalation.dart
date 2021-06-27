import 'package:flutter/material.dart';
import 'package:tezos_wallet/Models/operations/nonce_revelation_operation.dart';

class NonceRevelationView extends StatelessWidget {
  const NonceRevelationView({Key key, this.operation}) : super(key: key);
  final NonceRevelationOperation operation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
            Container(
                  width: double.infinity,
                  color: Colors.grey[300],
                   padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      operation.getType.toUpperCase(),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Text('Baker Reward : ${operation.bakerRewards}'),
              Text('Sender: ${operation.sender}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text(operation.timestamp)],
              )
            ],
          ),
        ),
      ),
    );
  }
}

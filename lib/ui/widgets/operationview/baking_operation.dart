import 'package:flutter/material.dart';
import 'package:tezos_wallet/Models/operations/activation.dart';
import 'package:tezos_wallet/Models/operations/baking.dart';

class BakingView extends StatelessWidget {
  const BakingView({Key key, this.operation}) : super(key: key);
  final BakingOperation operation;
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
              Text('Baker Address: ${operation.baker.address}'),
              Text('Deposit: ${operation.deposit}'),
              Text('Fee: ${operation.fees}'),
              Text('Reward: ${operation.reward}'),

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

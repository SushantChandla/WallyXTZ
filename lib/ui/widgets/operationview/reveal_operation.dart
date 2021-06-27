import 'package:flutter/material.dart';
import 'package:tezos_wallet/Models/operations/proposal.dart';
import 'package:tezos_wallet/Models/operations/reveal_operation.dart';

class RevealView extends StatelessWidget {
  const RevealView({Key key, this.operation}) : super(key: key);
  final RevealOperation operation;
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
              Text('Sender : ${operation.sender.address}'),
              Text('Baker Fee: ${operation.bakerFee}'),
              Text('Gas Used: ${operation.gasUsed}'),
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

import 'package:flutter/material.dart';
import 'package:tezos_wallet/Models/operations/origination_operation.dart';

class OriginationView extends StatelessWidget {
  const OriginationView({Key key, this.operation}) : super(key: key);
  final OriginationOperation operation;
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
              Text('Allocation fee : ${operation.allocationFee}'),
              Text('Contract Balance : ${operation.contractBalance}'),
              Text('Contract Manager : ${operation.contractManager}'),
              Text('Gas Used : ${operation.gasUsed}'),
              Text('Sender: ${operation.sender.address}'),
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

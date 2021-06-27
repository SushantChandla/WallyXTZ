import 'package:flutter/material.dart';
import 'package:tezos_wallet/Models/operations/delegation_operation.dart';

class DelegationView extends StatelessWidget {
  const DelegationView({Key key, this.operation}) : super(key: key);
  final DelegationOperation operation;
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
              Text('Ammount: ${operation.amount}'),
              Text('Baker Fee: ${operation.bakerFee}'),
              Text('Gas used: ${operation.gasUsed}'),
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

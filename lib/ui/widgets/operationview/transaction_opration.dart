import 'package:flutter/material.dart';
import 'package:tezos_wallet/Models/operations/transaction_operation.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({Key key, this.operation}) : super(key: key);
  final TransactionOperation operation;
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
              Text('Amount : ${operation.amount} mutez'),
              Text('Gas Used: ${operation.gasUsed}'),
              Text('Sender: ${operation.sender.address}'),
              Text('Target: ${operation.target.address}'),
              SizedBox(
                height: 10,
              ),
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

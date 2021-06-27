import 'package:flutter/material.dart';
import 'package:tezos_wallet/Models/operations/proposal.dart';

class ProposalView extends StatelessWidget {
  const ProposalView({Key key, this.operation}) : super(key: key);
  final ProposalOperation operation;
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
              Text('Address: ${operation.delegate.address}'),
              Text('Proposal Alias: ${operation.proposal.alias}'),
              Text('Duplicated: ${operation.duplicated}'),
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

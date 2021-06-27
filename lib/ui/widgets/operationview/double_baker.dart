import 'package:flutter/material.dart';
import 'package:tezos_wallet/Models/operations/double_baking.dart';

class DoubleBakerView extends StatelessWidget {
  const DoubleBakerView({Key key, this.operation}) : super(key: key);
  final DoubleBakingOperation operation;
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
              Text('Acc user Rewards: ${operation.accuserRewards}'),
              Text('Offender Lost Rewards: ${operation.offenderLostRewards}'),
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

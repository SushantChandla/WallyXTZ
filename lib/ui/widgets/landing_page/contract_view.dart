import 'package:flutter/material.dart';
import 'package:tezos_wallet/Models/accounts/contract.dart';
import 'package:tezos_wallet/ui/widgets/landing_page/transaction_buttons.dart';

class ContractView extends StatelessWidget {
  const ContractView({Key key,this.account}) : super(key: key);
  final ContractAccount account;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(account.address),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/tez.png',
              height: 24,
              width: 24,
            ),
            Text('${account.balance}',
                style: TextStyle(
                  fontSize: 24,
                ))
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TransactionButton(),
            TransactionButton(),
            TransactionButton(),
            TransactionButton(),
          ],
        ),
        Row(
          children: [
            Expanded(
                child: TextButton(onPressed: () => 1, child: Text('Assets'))),
            Expanded(
                child:
                    TextButton(onPressed: () => 1, child: Text('Delegates'))),
            Expanded(
                child:
                    TextButton(onPressed: () => 1, child: Text('Activities'))),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 10,
            )
          ],
        )
      ],
    );
  }
}

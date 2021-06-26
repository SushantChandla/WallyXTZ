import 'package:flutter/material.dart';

class TransactionButton extends StatelessWidget {
  const TransactionButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => 1,
        child: Column(
          children: [Icon(Icons.arrow_downward), Text('recive')],
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
        ));
  }
}

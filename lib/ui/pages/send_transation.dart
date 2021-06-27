import 'package:flutter/material.dart';
import 'package:tezos_wallet/state_management/appstate.dart';

class SendTransactionPage extends StatefulWidget {
  const SendTransactionPage({Key key}) : super(key: key);

  @override
  _SendTransactionPageState createState() => _SendTransactionPageState();
}

class _SendTransactionPageState extends State<SendTransactionPage> {
  String account = '';
  double amount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: Text(
          'Wally XTZ',
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.deepPurple[200],
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_upward),
                  Text('Send Tez'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Sender',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.deepPurple[300])),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/tez.png',
                          height: 24,
                          width: 24,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppState.instance.getAccountAddressCurrent(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${AppState.instance.getBalanceAccountCurrent()} Tez',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Recipient',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.deepPurple[300])),
                    child: TextFormField(
                      onChanged: (c) => account = c,
                      minLines: 2,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'tk1312lasdkkmdaksmdkakml',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Amount',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.deepPurple[300])),
                    child: TextFormField(
                      onChanged: (c) => amount = double.tryParse(c) ?? amount,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffix: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text('Tez'),
                        ),
                        hintText: '00000',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Text('Using the default gass free as  10000',style:TextStyle(color: Colors.grey)),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _makeTransation,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text('Send'),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.deepPurple),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side:
                                        BorderSide(color: Colors.deepPurple)))),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _makeTransation() async {
    AppState.instance.makeTransaction(account, amount);
    Navigator.pop(context);
  }
}

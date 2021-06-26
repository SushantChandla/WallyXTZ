import 'package:flutter/material.dart';
import 'package:tezos_wallet/ui/pages/import_account.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key key}) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  String selectedNetwork = 'etosnet';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.orange,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/logo.jpg',
                height: 48,
                width: 48,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      const Text(
                        'Account 1',
                        style: TextStyle(color: Colors.white),
                      ),
                      Card(
                        color: Colors.white12,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                                value: 1,
                                style: const TextStyle(),
                                items: const [
                                  DropdownMenuItem(
                                    child: Text("etosnet"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("123"),
                                    value: 2,
                                  ),
                                  DropdownMenuItem(
                                      child: Text("1312"), value: 3),
                                  DropdownMenuItem(
                                      child: Text("hhhh"), value: 4)
                                ],
                                onChanged: (value) {
                                  // setState(() {
                                  // _value = value;
                                  // });
                                }),
                          ),
                        ),
                      )
                    ],
                  ),
                  PopupMenuButton<int>(
                      offset: const Offset(100, 0),
                      itemBuilder: (context) => [
                            PopupMenuItem<int>(
                                value: 0, child: Text('Import Contract')),
                          ],
                      onSelected: (val) {
                        if (val == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ImportAccount()));
                        }
                      },
                      child: Image.asset('assets/icons8-robot-2-48.png'))
                ],
              )
            ],
          )),
    );
  }
}

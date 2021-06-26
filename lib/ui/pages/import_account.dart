import 'package:flutter/material.dart';
import 'package:tezos_wallet/ui/pages/landing.dart';
import 'package:tezos_wallet/ui/widgets/import_account/fundraiser_view.dart';
import 'package:tezos_wallet/ui/widgets/import_account/mnemonic_view.dart';
import 'package:tezos_wallet/ui/widgets/import_account/private_keyview.dart';
import 'package:tezos_wallet/ui/widgets/topbar.dart';

class ImportAccount extends StatefulWidget {
  const ImportAccount({Key key, this.firstLogin = false}) : super(key: key);
  final bool firstLogin;
  @override
  State<ImportAccount> createState() => _ImportAccountState();
}

class _ImportAccountState extends State<ImportAccount> {
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(),
            Container(
              color: Colors.grey[100],
              padding: EdgeInsets.all(
                10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Import account'), Icon(Icons.download)],
              ),
            ),
            if (widget.firstLogin) Text('Import a account to continue'),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttons('Private Key', 0),
                buttons('Mnemonic', 1),
                buttons('Fundraiser', 2)
              ],
            ),
            if (selectedValue == 0)
              PrivateKey(
                afterImport: afterImport,
              ),
            if (selectedValue == 1)
              MnemonicView(
                afterImport: afterImport,
              ),
            if (selectedValue == 2)
              FundraiserView(
                afterImport: afterImport,
              ),
          ],
        ),
      ),
    );
  }

  void afterImport() {
    if (widget.firstLogin) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LandingPage()));
    } else {
      Navigator.pop(context);
    }
  }

  Widget buttons(String text, int val) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextButton(
          onPressed: () => setState(() {
                selectedValue = val;
              }),
          child: Text(
            text,
            style: TextStyle(color: Colors.grey[600]),
          )),
    );
  }
}

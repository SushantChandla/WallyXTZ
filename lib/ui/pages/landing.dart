import 'package:flutter/material.dart';
import 'package:tezos_wallet/Models/account.dart';
import 'package:tezos_wallet/Models/accounts/contract.dart';
import 'package:tezos_wallet/Models/accounts/delegate.dart';
import 'package:tezos_wallet/Models/accounts/empty.dart';
import 'package:tezos_wallet/Models/accounts/user.dart';
import 'package:tezos_wallet/state_management/appstate.dart';
import 'package:tezos_wallet/ui/widgets/landing_page/contract_view.dart';
import 'package:tezos_wallet/ui/widgets/landing_page/delegate_view.dart';
import 'package:tezos_wallet/ui/widgets/landing_page/empty_view.dart';
import 'package:tezos_wallet/ui/widgets/landing_page/user_view.dart';
import 'package:tezos_wallet/ui/widgets/topbar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    AppState.instance.init();
  }

  @override
  Widget build(BuildContext context) {
    Accounts account;
    if (AppState.instance.accounts.isNotEmpty) {
      account = AppState.instance.accounts[AppState.instance.selectedAccount];
    }
    
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          TopBar(),
          Container(
            color: Colors.grey[100],
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Explore'), Icon(Icons.explore)],
            ),
          ),
          if (account != null && account.getType == UserAccount.type)
            UserAccountView(
              account: account,
            ),
          if (account != null && account.getType == ContractAccount.type)
            ContractView(
              account: account,
            ),
          if (account != null && account.getType == DelegateAccount.type)
            DelegateView(
              account: account,
            ),
          if (account != null && account.getType == EmptyAccount.type)
            EmptyView(
              account: account,
            ),
        ],
      ),
    ));
  }
}

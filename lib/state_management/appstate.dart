import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tezos_wallet/Models/account.dart';
import 'package:tezos_wallet/Networking/networking.dart';
import 'package:tezos_wallet/ui/pages/import_account.dart';

class AppState {
  AppState._();
  static AppState instance = AppState._();

  SharedPreferences pref;
  static GlobalKey<NavigatorState> naviagtorKey = GlobalKey();

  List<String> accountsAddress = [];

  List<Accounts> accounts = [];
  int selectedAccount = 0;

  String selectedNetwork = 'Mainnet';

  void init() async {
    pref = await SharedPreferences.getInstance();
    accountsAddress = pref.getStringList('accountsAddress') ?? [];
    selectedNetwork = pref.getString('selectedNetwork') ?? selectedNetwork;
    if (accountsAddress.isEmpty) {
      naviagtorKey.currentState.pushReplacement(MaterialPageRoute(
          builder: (context) => ImportAccount(
                firstLogin: true,
              )));
    } else {
      for (var address in accountsAddress) {
        var response = await getAccountInfo(selectedNetwork, address);
        accounts.add(accountFromJsonString(response.body,
            pref.getString('$address-pr'), pref.getString('$address-se')));
      }
    }
    _updateSink.add(true);
  }

  void addAccount(List<String> keys) async {
    accountsAddress.add(keys[2]);
    pref.setStringList('accountsAddress', accountsAddress);
    pref.setString('${keys[2]}-se', keys[0]);
    pref.setString('${keys[2]}-pr', keys[1]);
    var response = await getAccountInfo(selectedNetwork, keys[2]);
    accounts.add(accountFromJsonString(response.body, keys[0], keys[1]));
    _updateSink.add(true);
  }

  void changeSelectedNetwork(String network) async {
    selectedNetwork = network;
    pref.setString('selectedNetwork', selectedNetwork);
    for (var address in accountsAddress) {
      var response = await getAccountInfo(selectedNetwork, address);
      accounts.add(accountFromJsonString(response.body,
          pref.getString('$address-pr'), pref.getString('$address-se')));
    }
    _updateSink.add(true);
  }

  final BehaviorSubject<bool> _appStream = BehaviorSubject();
  Stream<bool> get updatesStream => _appStream.stream;
  Sink get _updateSink => _appStream.sink;
}

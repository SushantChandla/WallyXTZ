import 'package:flutter/material.dart';
import 'package:tezos_wallet/state_management/appstate.dart';
import 'package:tezos_wallet/ui/pages/landing.dart';
import 'package:tezster_dart/tezster_dart.dart';

void main() {
  TezsterDart.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: AppState.instance.updatesStream,
        builder: (context, snapshot) {
          print('refreshed');
          return MaterialApp(
            navigatorKey: AppState.naviagtorKey,
            title: 'Wally XTZ',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: LandingPage(),
          );
        });
  }
}

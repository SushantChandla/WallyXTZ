import 'dart:convert';

import 'package:tezos_wallet/Models/accounts/contract.dart';
import 'package:tezos_wallet/Models/accounts/delegate.dart';
import 'package:tezos_wallet/Models/accounts/empty.dart';
import 'package:tezos_wallet/Models/accounts/user.dart';

abstract class Accounts {
  String get getType;
}

Accounts accountFromJsonString(String s, String pr, String se) {
  Map<String, dynamic> json = jsonDecode(s);
  if (json['type'] == ContractAccount.type) {
    return ContractAccount.fromJson(json, se, pr);
  }

  if (json['type'] == DelegateAccount.type) {
    return DelegateAccount.fromJson(json, se, pr);
  }

  if (json['type'] == UserAccount.type) {
    return DelegateAccount.fromJson(json, se, pr);
  }
  if (json['type'] == EmptyAccount.type) {
    return EmptyAccount.fromJson(json, se, pr);
  }

  return null;
}

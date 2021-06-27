import 'dart:convert';

import 'package:tezos_wallet/Models/operations/activation.dart';
import 'package:tezos_wallet/Models/operations/baking.dart';
import 'package:tezos_wallet/Models/operations/ballot.dart';
import 'package:tezos_wallet/Models/operations/delegation_operation.dart';
import 'package:tezos_wallet/Models/operations/double_baking.dart';
import 'package:tezos_wallet/Models/operations/endorsements.dart';
import 'package:tezos_wallet/Models/operations/nonce_revelation_operation.dart';
import 'package:tezos_wallet/Models/operations/origination_operation.dart';
import 'package:tezos_wallet/Models/operations/proposal.dart';
import 'package:tezos_wallet/Models/operations/reveal_operation.dart';
import 'package:tezos_wallet/Models/operations/transaction_operation.dart';

abstract class Operation {
  Map<String, dynamic> toJson();
  String get getType;
}

Operation operationFromJsonString(Map<String, dynamic> json) {
  if (json['type'] == ActivationOperation.type) {
    return ActivationOperation.fromJson(json);
  }

  if (json['type'] == BakingOperation.type) {
    return BakingOperation.fromJson(json);
  }

  if (json['type'] == BallotOperation.type) {
    return BallotOperation.fromJson(json);
  }

  if (json['type'] == DelegationOperation.type) {
    return DelegationOperation.fromJson(json);
  }

  if (json['type'] == DoubleBakingOperation.type) {
    return DoubleBakingOperation.fromJson(json);
  }

  if (json['type'] == EndorsementOperation.type) {
    return EndorsementOperation.fromJson(json);
  }

  if (json['type'] == NonceRevelationOperation.type) {
    return NonceRevelationOperation.fromJson(json);
  }

  if (json['type'] == OriginationOperation.type) {
    return OriginationOperation.fromJson(json);
  }

  if (json['type'] == ProposalOperation.type) {
    return ProposalOperation.fromJson(json);
  }

  if (json['type'] == RevealOperation.type) {
    return RevealOperation.fromJson(json);
  }

  if (json['type'] == RevealOperation.type) {
    return RevealOperation.fromJson(json);
  }

  if (json['type'] == TransactionOperation.type) {
    return TransactionOperation.fromJson(json);
  }

  return null;
}

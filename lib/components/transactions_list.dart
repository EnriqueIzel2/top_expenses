import 'package:flutter/material.dart';

import 'package:top_expenses/models/transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionsList(Key? key, this.transactions) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Tensacriton");
  }
}

import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'package:top_expenses/components/transactions_form.dart';
import 'package:top_expenses/components/transactions_list.dart';
import 'package:top_expenses/models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: "t1",
      title: "novo tênis",
      value: 300.10,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "conta de luz",
      value: 200.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t3",
      title: "conta de internet",
      value: 200.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t4",
      title: "conta do agiota",
      value: 200.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t5",
      title: "conta do agiota",
      value: 200.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t6",
      title: "conta do agiota",
      value: 200.30,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionsForm(onSubmit: _addTransaction),
        TransactionsList(transactions: _transactions),
      ],
    );
  }
}

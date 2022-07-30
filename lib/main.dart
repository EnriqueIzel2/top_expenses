import 'package:flutter/material.dart';
import 'package:top_expenses/components/transactions_form.dart';
import 'package:top_expenses/components/transactions_list.dart';

import 'package:top_expenses/models/transaction.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
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
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Despesas"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text("Gráfico"),
              ),
            ),
            TransactionsList(transactions: _transactions),
            TransactionsForm(),
          ],
        ),
      ),
    );
  }
}

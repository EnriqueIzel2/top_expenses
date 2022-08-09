import 'package:flutter/material.dart';
import 'dart:math';

import 'package:top_expenses/components/transactions_form.dart';
import 'package:top_expenses/components/transactions_list.dart';
import 'package:top_expenses/models/transaction.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData();

    return MaterialApp(
      home: const HomeScreen(),
      theme: themeData.copyWith(
        colorScheme: themeData.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
        textTheme: themeData.textTheme.copyWith(
          headline6: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: "OpenSans",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

    Navigator.of(context).pop();
  }

  _openTransactionsFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => TransactionsForm(onSubmit: _addTransaction),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Despesas"),
        actions: [
          IconButton(
            onPressed: () => _openTransactionsFormModal(context),
            icon: const Icon(Icons.add),
          ),
        ],
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openTransactionsFormModal(context),
      ),
    );
  }
}

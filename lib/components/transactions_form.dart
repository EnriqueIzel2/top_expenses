import 'package:flutter/material.dart';

class TransactionsForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  TransactionsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Nome da despesa",
              ),
            ),
            TextField(
              controller: valueController,
              decoration: const InputDecoration(
                labelText: "Valor (R\$)",
              ),
            ),
            TextButton(
              onPressed: () {
                print(titleController.text);
                print(valueController.text);
              },
              style: TextButton.styleFrom(
                textStyle: const TextStyle(color: Colors.purple),
              ),
              child: const Text("Nova Transação"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TransactionsForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final void Function(String, double) onSubmit;

  TransactionsForm({Key? key, required this.onSubmit}) : super(key: key);

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
                final title = titleController.text;
                final value = double.tryParse(valueController.text) ?? 0.0;
                onSubmit(title, value);
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

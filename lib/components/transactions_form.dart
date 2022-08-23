import 'package:flutter/material.dart';

class TransactionsForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  const TransactionsForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<TransactionsForm> createState() => _TransactionsFormState();
}

class _TransactionsFormState extends State<TransactionsForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value);
  }

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
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: "Nome da despesa",
              ),
            ),
            TextField(
              controller: valueController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: "Valor (R\$)",
              ),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  const Text("Nenhuma data selecionada!"),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Selecionar data",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      color: Theme.of(context).textTheme.button?.color,
                    ),
                  ),
                  child: const Text("Nova Transação"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

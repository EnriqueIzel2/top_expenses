import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:top_expenses/components/chart_bar.dart';
import 'package:top_expenses/models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart({Key? key, required this.recentTransactions}) : super(key: key);

  List<Map<String, dynamic>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      final dayFirstLetter = DateFormat('EEE', 'pt_BR').format(weekDay)[0];
      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        bool isSameDay = recentTransactions[i].date.day == weekDay.day;
        bool isSameMonth = recentTransactions[i].date.month == weekDay.month;
        bool isSameYear = recentTransactions[i].date.year == weekDay.year;

        if (isSameDay && isSameMonth && isSameYear) {
          totalSum += recentTransactions[i].value;
        }
      }

      return {'day': dayFirstLetter, 'value': totalSum};
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, currentValue) {
      return sum + currentValue['value'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((transaction) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: transaction['day'].toString(),
                value: transaction['value'],
                percentage: _weekTotalValue == 0
                    ? 0
                    : transaction['value'] / _weekTotalValue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

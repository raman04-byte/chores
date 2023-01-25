import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  List<Transation> recentTransations = [];
  Chart(this.recentTransations, {super.key});

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;
      for (var i = 0; i < recentTransations.length; i++) {
        if (recentTransations[i].date.day == weekday.day &&
            recentTransations[i].date.month == weekday.month &&
            recentTransations[i].date.year == weekday.year) {
          totalSum += recentTransations[i].amount;
        }
      }
      return {'day': DateFormat.E().format(weekday).substring(0,1), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionValues.map((data) {
          return Text('${data['day']}: ${data['amount']}');
        }).toList(),
      ),
    );
  }
}

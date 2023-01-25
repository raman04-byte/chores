import 'package:chores/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  late final List<Transation> transations;
  TransactionList(this.transations);
  @override
  Widget build(BuildContext context) {
    return Column(
        children: transations.map((e) {
      return Card(
        child: Row(children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.purple.shade600,
              width: 2,
            )),
            padding: EdgeInsets.all(10),
            child: Text(
              '\$ ${e.amount}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.purple.shade600),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                e.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                DateFormat.yMMMd().format(e.date),
                style: TextStyle(color: Colors.grey.shade700),
              )
            ],
          )
        ]),
      );
    }).toList());
  }
}

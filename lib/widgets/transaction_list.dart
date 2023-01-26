import 'package:chores/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  final List<Transation> transations;
  const TransactionList(this.transations, {super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transation> transations = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.purple,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: FittedBox(
                      child: Text(
                        '\$${widget.transations[index].amount}',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.transations[index].title,
                        style: Theme.of(context).textTheme.titleLarge),
                    Text(
                      '   ' +
                          DateFormat.yMMMd()
                              .format(widget.transations[index].date),
                      style: TextStyle(color: Colors.grey.shade700),
                    )
                  ],
                )
              ],
            ),
          );
        },
        itemCount: widget.transations.length,
      ),
    );
  }
}

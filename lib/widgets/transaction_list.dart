import 'package:chores/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  List<Transation> transations;
  final Function deleteTx;
  TransactionList(this.transations, this.deleteTx, {super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
            child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                        '\$${widget.transations[index].amount}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 40),
                      ),
                        ),
                      ),
                    ),
                    title: Text(widget.transations[index].title,
                        style: Theme.of(context).textTheme.titleLarge),
                    subtitle: Text(
                      '${DateFormat.yMMMd().format(widget.transations[index].date)}',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Theme.of(context).colorScheme.error,
                      onPressed: () =>
                          widget.deleteTx(widget.transations[index].id),
                    )
                  ),
                );
              },
              itemCount: widget.transations.length,
            ),
    );
  }
}

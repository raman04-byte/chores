import 'package:chores/widgets/new_tranaction.dart';
import 'package:chores/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transation> _userTransaction = [
    Transation(
      id: 't1',
      title: 'New chores',
      amount: 69.68,
      date: DateTime.now(),
    ),
    Transation(
      id: 't2',
      title: 'New chores2',
      amount: 17.68,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transation(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(),
        TransactionList(_userTransaction),
      ],
    );
  }
}

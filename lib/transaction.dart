import 'package:flutter/material.dart';
class Transation {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transation(
      {
      required this.id,
      required this.title,
      required this.amount,
      required this.date});
}

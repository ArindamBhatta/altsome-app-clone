import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

final formatter = DateFormat.yMd();
const Uuid uuid = Uuid();

enum Category {
  food,
  travel,
  leisure,
  work,
  shopping,
  other,
}

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
  Category.shopping: Icons.shopping_bag,
  Category.other: Icons.more_horiz,
};

class ExpenseInterface {
  ExpenseInterface({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  //* getter method
  String get formattedDate {
    return formatter.format(date); //DateTime.now()
  }
}

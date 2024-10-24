import 'package:flutter/material.dart';
import 'expense_interface.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard(
    this.expenseIndex, {
    super.key,
  });
  final ExpenseInterface expenseIndex;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expenseIndex.title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(categoryIcons[expenseIndex.category] ??
                    Icons.error_outline),
                const SizedBox(width: 8.0),
                Text(
                  expenseIndex.formattedDate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

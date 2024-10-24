import 'package:flutter/material.dart';
import 'expense_interface.dart';
import 'expense_card.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenseList,
    required this.onTapToRemoveIndex,
  });
  final List<ExpenseInterface> expenseList;
  final Function(ExpenseInterface) onTapToRemoveIndex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expenseList.length,
        itemBuilder: (context, index) => Dismissible(
          key: ValueKey(expenseList[index]),
          onDismissed: (direction) {
            onTapToRemoveIndex(expenseList[index]);
          },
          background: Container(
            alignment: Alignment.centerRight,
            color: Colors.red,
            padding: const EdgeInsets.only(right: 20.0),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          child: ExpenseCard(
            expenseList[index],
          ),
        ),
      ),
    );
  }
}

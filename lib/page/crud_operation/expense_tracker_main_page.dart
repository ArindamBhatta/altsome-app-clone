import 'expense_interface.dart';
import 'package:flutter/material.dart';
import 'expense_list.dart';
import 'add_expense.dart';
import 'chart.dart';

class ExpenseTrackerMainPage extends StatefulWidget {
  const ExpenseTrackerMainPage({super.key});
  @override
  State<ExpenseTrackerMainPage> createState() {
    return _ExpenseTrackerMainPageState();
  }
}

class _ExpenseTrackerMainPageState extends State<ExpenseTrackerMainPage> {
  final List<ExpenseInterface> wholeExpenseList = [];

  void addExpenseOnTap() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (modalBottomSheetContext) => new AddExpense(
        onTapToAddExpense: addNewExpenseMethod,
      ),
    );
  }

  void addNewExpenseMethod(ExpenseInterface newExpense) {
    print("passing from addExpense constructor method: $newExpense");
    setState(() {
      wholeExpenseList.add(newExpense);
    });
  }

  void removeSingleExpense(ExpenseInterface singleExpense) {
    final expensesRemoveIndex = wholeExpenseList.indexOf(singleExpense);
    setState(() {
      wholeExpenseList.remove(singleExpense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text('Expense ${singleExpense.title} was removed.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(
              () {
                wholeExpenseList.insert(expensesRemoveIndex, singleExpense);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mainContainer = wholeExpenseList.isEmpty
        ? const Center(
            child: Text('No expenses found. Start adding some!'),
          )
        : ExpenseList(
            expenseList: wholeExpenseList,
            onTapToRemoveIndex: removeSingleExpense,
          );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: addExpenseOnTap,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Chart(
              expenses: wholeExpenseList,
            ),
          ),
          Expanded(
            child: mainContainer,
          ),
        ],
      ),
    );
  }
}

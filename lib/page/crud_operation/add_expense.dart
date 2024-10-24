import 'package:flutter/material.dart';
import 'expense_interface.dart';

class AddExpense extends StatefulWidget {
  final void Function(ExpenseInterface expense) onTapToAddExpense;

  const AddExpense({
    super.key,
    required this.onTapToAddExpense,
  });

  @override
  State<AddExpense> createState() {
    return _AddExpenseState();
  }
}

class _AddExpenseState extends State<AddExpense> {
  final titleInputBinding = TextEditingController();
  final amountInputBinding = TextEditingController();
  DateTime? selectedDate;
  Category expenseOnSelectItem = Category.food;

  void presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final userPickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      selectedDate = userPickedDate;
    });
  }

  void submitExpenseOnTap() {
    final entireAmount = double.tryParse(amountInputBinding.text);

    if (titleInputBinding.text.trim().isEmpty ||
        entireAmount == null ||
        entireAmount <= 0 ||
        selectedDate == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
            'Please make sure to enter valid title, amount and date category was entered.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            )
          ],
        ),
      );
      return;
    }
    widget.onTapToAddExpense(
      ExpenseInterface(
        title: titleInputBinding.text,
        amount: entireAmount,
        date: selectedDate!,
        category: expenseOnSelectItem,
      ),
    );
  }

  @override
  void dispose() {
    titleInputBinding.dispose();
    amountInputBinding.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextField(
            controller: titleInputBinding,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'), //* Placeholder text
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountInputBinding,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: ' \$ ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    selectedDate == null
                        ? 'No Date Chosen'
                        : formatter.format(selectedDate!),
                  ),
                  IconButton(
                    onPressed: presentDatePicker,
                    icon: const Icon(
                      Icons.calendar_month,
                      color: Color.fromARGB(255, 57, 18, 196),
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<Category>(
                value: expenseOnSelectItem,
                items: Category.values.map((individual) {
                  return DropdownMenuItem(
                    value: individual,
                    child: Text(
                      individual.name.toUpperCase(),
                    ),
                  );
                }).toList(),
                onChanged: (Category? value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    expenseOnSelectItem = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  submitExpenseOnTap();
                  Navigator.pop(context);
                },
                child: const Text('Save Expense'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'expense_interface.dart';

class ExpenseBucketInterface {
  Category enumCategory;
  List<ExpenseInterface> filteredExpense;

  ExpenseBucketInterface({
    required this.enumCategory,
    required this.filteredExpense,
  });

  //* name constructor
  ExpenseBucketInterface.nameConstructorFilterExp(
    List<ExpenseInterface> allExpenses,
    this.enumCategory,
  ) : this.filteredExpense = allExpenses.where(
          (singleExpanse) {
            return singleExpanse.category == enumCategory;
          },
        ).toList();

  //* getter
  double get totalExpenses {
    double sum = 0;
    for (final expense in filteredExpense) {
      sum += expense.amount;
    }
    return sum;
  }
}

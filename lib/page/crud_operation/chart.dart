import 'package:flutter/material.dart';
import 'expense_interface.dart';
import 'expense_bucket_interface.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});
  final List<ExpenseInterface> expenses;

  List<ExpenseBucketInterface> get bucketInterfaceMap {
    return [
      ExpenseBucketInterface.nameConstructorFilterExp(expenses, Category.food),
      ExpenseBucketInterface.nameConstructorFilterExp(
          expenses, Category.travel),
      ExpenseBucketInterface.nameConstructorFilterExp(
          expenses, Category.leisure),
      ExpenseBucketInterface.nameConstructorFilterExp(expenses, Category.work),
      ExpenseBucketInterface.nameConstructorFilterExp(
          expenses, Category.shopping),
      ExpenseBucketInterface.nameConstructorFilterExp(expenses, Category.other),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;
    for (final bucket in bucketInterfaceMap) {
      if (maxTotalExpense < bucket.totalExpenses) {
        maxTotalExpense = bucket.totalExpenses;
      }
    }
    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in bucketInterfaceMap)
                  ChartBar(
                    fill: bucket.totalExpenses == 0
                        ? 0
                        : bucket.totalExpenses / maxTotalExpense,
                  )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: bucketInterfaceMap
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        categoryIcons[bucket.enumCategory],
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.7),
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}

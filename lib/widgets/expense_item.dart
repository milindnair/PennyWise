import 'package:expense_tracker/models/expense_Schema.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 12.0,
        ),
        child: Column(
          children: [
            Text(
              expense.title,
            ),
            const SizedBox(height: 4.0),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      categoryIcons[expense.category],
                      size: 16.0,
                    ),
                    const SizedBox(width: 8.0),
                    Text(expense.date.toString()),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

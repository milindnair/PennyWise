
import 'package:expense_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';
import '../../models/expense_schema.dart';


class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});
  final void Function(Expense expense) onRemoveExpense;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
          key: ValueKey(expenses[index]),
          background: Container(
            color: Theme.of(context).colorScheme.error,
            margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal),
          ),
          onDismissed: (direction) => {onRemoveExpense(expenses[index])},
          child: ExpenseItem(expenses[index]),
          ),
    );
  }
}

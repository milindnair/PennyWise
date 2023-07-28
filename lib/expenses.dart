import 'package:expense_tracker/widgets/expense_list/expense_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'models/expense_Schema.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    // Expense(
    //   title: 'Groceries',
    //   amount: 100.00,
    //   date: DateTime.now(),
    //   category: Category.food,
    // ),
    // Expense(
    //   title: 'Gas',
    //   amount: 50.00,
    //   date: DateTime.now(),
    //   category: Category.travel,
    // ),
    // Expense(
    //   title: 'Lunch',
    //   amount: 20.00,
    //   date: DateTime.now(),
    //   category: Category.food,
    // ),
    // Expense(
    //   title: 'Dinner',
    //   amount: 30.00,
    //   date: DateTime.now(),
    //   category: Category.food,
    // ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${expense.title} removed'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex,expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses added yet'),
    );

    if(_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(expenses: _registeredExpenses , onRemoveExpense: _removeExpense,);
    }
    
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
        title: const Text('Expenses'),
      ),
      body: Column(
        children: [
          const Text('Expenses'),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}

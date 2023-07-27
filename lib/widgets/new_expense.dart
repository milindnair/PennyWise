import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            maxLength: 20,
            decoration: InputDecoration(
              labelText: 'Title',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Amount',
            ),

          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Date',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Category',
            ),
          ),
          ElevatedButton(
            onPressed: null,
            child: Text('Add Expense'),
          ),
        ],
      ),
    );
  }
}

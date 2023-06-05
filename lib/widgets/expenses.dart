
import 'package:flutter/material.dart';
import 'package:testagain/widgets/chart/chart_bar.dart';
import 'package:testagain/widgets/expenses_list/expenses_list.dart';
import 'package:testagain/model/expense.dart';
import 'package:testagain/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
   Expense(title: 'title', amount: 12, date: DateTime.now(), category: Category.food),
   Expense(title: 'title1', amount: 122, date: DateTime.now(), category: Category.leisure),
   Expense(title: 'title2', amount: 123, date: DateTime.now(), category: Category.work),
  ];

  void _openBottomSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense));
  }
  
  void _addExpense(Expense expense){
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense){
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const  Duration(seconds: 3),
        content: const Text('Expense deleted!'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
          ),
        )
      );
  }
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('No expenses found'),
    );
    if(_registeredExpenses.isNotEmpty){
      mainContent = ExpensesList(
              expenses: _registeredExpenses,
              onRemoveExpense: _removeExpense
              );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn UI Flutter'),
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: _openBottomSheet, 
            icon: const Icon(Icons.add),
            ),
        ],
      ),
      body: width < 600 ?  Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: mainContent
            ),
        ],
      ) : Row(
        children: [
          Expanded(child: Chart(expenses: _registeredExpenses)),
          Expanded(
            child: mainContent
            ),
        ],
      ),
    );
  }
}
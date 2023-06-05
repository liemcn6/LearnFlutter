import 'package:flutter/material.dart';
import 'package:testagain/model/expense.dart';
import 'package:testagain/screens/categories.dart';
import 'package:testagain/screens/tabs.dart';
import 'package:testagain/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  // void _selectItem(BuildContext context){
  //   Route route = MaterialPageRoute(builder: (context) => const CategoriesScreen(),) ;
  //   Navigator.push(context,route);
  // }
  @override
  Widget build(BuildContext context) {
    return ListView.builder( 
      itemCount: expenses.length ,
      itemBuilder: (ctx,index) => Dismissible(
        key: ValueKey(expenses[index]), // ==ObjectKey(expenses[index])
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.65),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          )
        ),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(onSelectItem: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const TabsScreen(),));
        }, expense: expenses[index],)
        ),
      );
  }
}
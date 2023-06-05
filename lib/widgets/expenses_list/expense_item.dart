import 'package:flutter/material.dart';
import 'package:testagain/model/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.onSelectItem, required this.expense});

  final Expense expense;
  final void Function() onSelectItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onSelectItem,
        splashColor: Theme.of(context).focusColor,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(expense.title,
              style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: 4,),
              Row(
                children: [
                  Text('\$${expense.amount.toStringAsFixed(2)}'),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[expense.category]),
                      const SizedBox(width: 8,),
                      Text(expense.getFormatDate)
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
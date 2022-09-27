import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import "package:flutter/material.dart";
import "../components/transaction_form.dart";
import '../components/transaction_list.dart';
import "../models/transaction.dart";
class TransactionUser extends StatefulWidget {
  

  @override
  _TransactionUser createState() => _TransactionUser();
}

class _TransactionUser extends State<TransactionUser> {

  final _transactions = [
    Transaction(
      id: "t1",
      title: "Novo Tênis de Corrida",
      value: 310.77,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Conta de Luz",
      value: 120.88,
      date: DateTime.now(),
    )
  ];
  _addTransaction(String title, double value){
    final newTransaction =  Transaction(
      id: "Random().nextDouble().toString()",
      title: title,
      value: value,
      date: DateTime.now(),
    );
    setState(()
    {
      _transactions.add(newTransaction);

    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(_addTransaction),
      ],
    );
  }
}
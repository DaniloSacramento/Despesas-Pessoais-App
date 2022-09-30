
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import "../components/transaction_form.dart";
import '../components/transaction_list.dart';
import "../models/transaction.dart";
import "dart:math";




main() => runApp(ExpensesApp());
class ExpensesApp extends StatelessWidget {
  final ThemeData tema = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage(),
    theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.purple[800],
          secondary: Colors.black,
          
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


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

    Navigator.of(context).pop(); // O pop sere para fechar 
  }

  _openTransactionFormModal(BuildContext context){
    showModalBottomSheet(
      context: context,
       builder: (ctx){
        return TransactionForm(_addTransaction);
       }

       );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Pessoais"),
        actions: [
          IconButton(icon: Icon(Icons.add),
          onPressed: () => _openTransactionFormModal(context) ,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            Container(
              child: const Card(
                color: Colors.blue,
                child: Text("Grafico"),
                elevation: 5,
              ),
            ),
            TransactionList(_transactions),
           
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()  => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
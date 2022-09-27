import 'package:expenses/components/transaction_user.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';




main() => runApp(ExpensesApp());
class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Pessoais"),
      ),
      body: Column(
        
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Container(
            width: double.infinity,
            child: const Card(
              color: Colors.blue,
              child: Text("Grafico"),
            ),
          ),
          TransactionUser(),
        ],
      )
    );
  }
}
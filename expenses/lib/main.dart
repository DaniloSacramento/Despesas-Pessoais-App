import 'package:expenses/models/transaction.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


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
          Column(
            children: _transactions.map((tr) { 
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 196, 57, 221),
                          width: 2,
                          ),
                          
                      ),
                      padding: EdgeInsets.all(10) ,   // Todas direçoes margin de 10
                      child: Text(
                      "R\$ ${tr.value.toString()}" ,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          Text(tr.title.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),),
                          Text(
                            DateFormat('d MMM y').format(tr.date),
                          style:  TextStyle(
                            fontSize: 14,
                             color: Colors.grey[250]
                          ),)
                        ],                        
                      )
                  ],
                ),
              );
            }).toList(),
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                 const TextField(
                    decoration: InputDecoration(
                      labelText: "Título",
                    ),
                  ),
                    const TextField (
                      decoration: InputDecoration(
                        labelText: "Valor (R\$)",
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                       TextButton(
                          child: const Text("Nova Transação" ,
                        style: const TextStyle(
                            color: Colors.purple,
                          ),
                          ),
                          onPressed: () {},
                          ),
                      ],
                    )
              ],
              ),
            ),
          )
        ],
      )
    );
  }
}
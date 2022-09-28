import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import "../models/transaction.dart";
import 'package:intl/intl.dart';


class TransactionList extends StatelessWidget {
 
 final List<Transaction> transactions;

 TransactionList(
  this.transactions
 );


  @override
  Widget build(BuildContext context) {
    return Column(
            children: transactions.map((tr) { 
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
          );
        }
      }
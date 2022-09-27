import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
   final titleControler = TextEditingController();  // O estado interno ainda vai mudar
   final valueControler = TextEditingController();
   final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                  controller: titleControler,
                    decoration: InputDecoration(
                      labelText: "Título",
                    ),
                  ),
                     TextField (
                      controller: valueControler,
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
                          onPressed: () {
                            final title = titleControler.text;
                            final value = double.tryParse(valueControler.text) ?? 0.0;
                            onSubmit(title, value);
                          },
                       ),
                    ],
                 )
              ],
              ),
            ),
          );
  }
}
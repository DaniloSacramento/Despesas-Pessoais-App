import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
   final titleControler = TextEditingController();  // O estado interno ainda vai mudar
   final valueControler = TextEditingController();
   final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  _submitForm () {
                    final title = titleControler.text;
                    final value = double.tryParse(valueControler.text) ?? 0.0;
                        
                    if(title.isEmpty || value <= 0 ) {
                         return;
                            }
                    onSubmit(title, value);
                          }

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
                  onSubmitted: (_) => _submitForm(),
                    decoration: InputDecoration(
                      labelText: "Título",
                    ),
                  ),
                     TextField (
                      controller: valueControler,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      onSubmitted: (_) => _submitForm()
                      ,
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
                          onPressed: _submitForm ,
                       ),
                    ],
                 )
              ],
              ),
            ),
          );
  }
}
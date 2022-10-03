import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

  final String ? label;
  final double ? value;
  final double ? percentage;

  ChartBar({this.label, this.value, this.percentage});
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('R\$${value!.toStringAsFixed(2)}'),
        SizedBox(height: 5,),
        Container(
          height: 60,
          width: 10,
          child: null,
        ),
        SizedBox(height: 5),
        Text(label!),
      ],
    );
  }
}
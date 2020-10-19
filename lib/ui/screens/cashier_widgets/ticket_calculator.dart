import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

class TicketCalculator extends StatefulWidget {
  @override
  _TicketCalculatorState createState() => _TicketCalculatorState();
}

class _TicketCalculatorState extends State<TicketCalculator> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(
              child: SimpleCalculator(
            theme: const CalculatorThemeData(
              displayColor: Colors.white,
              displayStyle: const TextStyle(fontSize: 80, color: Colors.black),
              /*...*/
            ),
          )),
        ),
        // Container(
        //   height: 80,
        //   child: Text("data"),
        // )
      ],
    );
  }
}

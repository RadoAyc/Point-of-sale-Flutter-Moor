import 'package:flutter/material.dart';
import 'package:pos_v1/ui/screens/widgets/cards/rounded_card_display.dart';

class AdminRecipeSearchTotal extends StatefulWidget {
  @override
  _AdminRecipeSearchTotalState createState() => _AdminRecipeSearchTotalState();
}

class _AdminRecipeSearchTotalState extends State<AdminRecipeSearchTotal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
            child: RoundedDisplayCard(
          titleColor: Color(0xffe1ffc2),
          contentColor: Color(0xffc7e2b2),
          titleText: 'Nombre de ticket :',
          contentText: '150',
        )),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: RoundedDisplayCard(
          titleColor: Color(0xffb2ebf2),
          contentColor: Color(0xff00bcd4),
          titleText: 'Totale :',
          contentText: '150.00',
        )),
      ]),
    );
  }
}

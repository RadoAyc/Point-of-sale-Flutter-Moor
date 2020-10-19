import 'package:flutter/material.dart';

class ButtonIconText extends StatelessWidget {
  final Color color;
  final String text;
  final Function function;
  final IconData icon;
  const ButtonIconText({
    Key key,
    this.color,
    this.text,
    this.function,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        //fit: FlexFit.loose,
        child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(0.0),
            ),
            color: color,
            onPressed: function,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 40,
                ),
                Text(text),
              ],
            )));
  }
}

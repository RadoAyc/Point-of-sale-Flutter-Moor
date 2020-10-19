import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonRowIconText extends StatelessWidget {
  final Color color;
  final String text;
  final Function function;
  final IconData icon;
  const ButtonRowIconText({
    Key key,
    this.color,
    this.text,
    this.function,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: RaisedButton.icon(
      icon: FaIcon(icon),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(0.0),
      ),
      color: color,
      onPressed: function,
      label: Text(text),
    ));
  }
}

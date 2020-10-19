import 'package:flutter/material.dart';

class TableStyles {
  static TableBorder tableBorder = TableBorder.symmetric(
    inside: BorderSide(
      width: 1,
      color: Colors.black54,
    ),
  );

  static TableCell tableCellHeader(String text) {
    return TableCell(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Text(text, style: TextStyle(fontSize: 18.0))),
    ));
  }

  static TableCell tableCellArticle(String text) {
    return TableCell(
        child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Center(child: Text(text, style: TextStyle(fontSize: 15.0))),
    ));
  }

  // static tableFlex(int position, double flex) =>
  //     {position: FlexColumnWidth(flex)};
}

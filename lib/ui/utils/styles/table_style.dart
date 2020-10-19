import 'package:flutter/material.dart';

class TableStyle {
  // TAbles

  static TableRow headerTableRow(
      String qte, String title, String pu, String pt) {
    return TableRow(children: [
      TableCell(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text(qte, style: TextStyle(fontSize: 18.0))),
      )),
      TableCell(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text(title, style: TextStyle(fontSize: 18.0))),
      )),
      TableCell(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text(pu, style: TextStyle(fontSize: 18.0))),
      )),
      TableCell(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text(pt, style: TextStyle(fontSize: 18.0))),
      )),
    ]);
  }

  static TableRow articleTableRow(var qte, var title, var pu, var pt) {
    return TableRow(decoration: BoxDecoration(), children: [
      TableCell(
          child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
            child: Text(qte.toString(), style: TextStyle(fontSize: 15.0))),
      )),
      TableCell(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(title.toString(), style: TextStyle(fontSize: 18.0))),
      )),
      TableCell(
          child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
            child: Text(pu.toString(), style: TextStyle(fontSize: 15.0))),
      )),
      TableCell(
          child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
            child: Text(pt.toString(),
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold))),
      )),
    ]);
  }
}

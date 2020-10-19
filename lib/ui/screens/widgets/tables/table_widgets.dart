import 'package:flutter/material.dart';

class TableWidgets extends StatelessWidget {
  final Map<int, TableColumnWidth> tableFlex;
  final List<Widget> tableCellList;
  final TableBorder tableBorder;

  TableWidgets({this.tableFlex, this.tableCellList, this.tableBorder});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Table(
        columnWidths: tableFlex,
        border: tableBorder,
        children: [TableRow(children: tableCellList)],
      ),
    ]));
  }
}

import 'package:flutter/material.dart';
import 'package:pos_v1/ui/utils/styles/table_style.dart';

class TicketDisplayTable extends StatelessWidget {
  const TicketDisplayTable({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          child: Container(
            color: Colors.white,
            // height: 200,
            child: Center(
              child: Table(
                  columnWidths: {
                    0: FlexColumnWidth(),
                    1: FlexColumnWidth(4),
                    2: FlexColumnWidth(),
                    3: FlexColumnWidth(),
                    //0: IntrinsicColumnWidth(), // i want this one to take the rest available space
                  },
                  border: TableBorder.symmetric(
                    inside: BorderSide(
                      width: 1,
                      color: Colors.black54,
                    ),
                  ),
                  children: [
                    TableStyle.headerTableRow('Qte', 'Title', 'P.U', 'P.T'),
                  ]),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                    child: Table(
                        columnWidths: {
                          0: FlexColumnWidth(),
                          1: FlexColumnWidth(4),
                          2: FlexColumnWidth(),
                          3: FlexColumnWidth(),
                          //0: IntrinsicColumnWidth(), // i want this one to take the rest available space
                        },
                        border: TableBorder.symmetric(
                          inside: BorderSide(
                            width: 1,
                            color: Colors.black54,
                          ),
                        ),
                        children: [
                          TableStyle.articleTableRow(1, 'Huillor 5L', 40, 40),
                        ])),
              );
            },
            itemCount: 15,
          ),
        ),
        Card(
          child: Table(
            columnWidths: {
              0: FlexColumnWidth(),
              1: FlexColumnWidth(),
              2: FlexColumnWidth(),
              3: FlexColumnWidth(),
            },
            border: TableBorder.symmetric(
              // outside: BorderSide(
              //   width: 1,
              // ),
              inside: BorderSide(
                width: 1,
                color: Colors.black54,
              ),
            ),
            children: [
              TableRow(children: [
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text('Nombre Articles : ',
                          style: TextStyle(fontSize: 14.0))),
                )),
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text('15', style: TextStyle(fontSize: 18.0))),
                )),
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text('Totale',
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))),
                )),
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child:
                          Text('150.00 DH', style: TextStyle(fontSize: 18.0))),
                )),
              ]),
            ],
          ),
        )
      ],
    );
  }
}

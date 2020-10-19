import 'package:flutter/material.dart';
import 'package:pos_v1/ui/screens/widgets/tables/table_styles.dart';
import 'package:pos_v1/ui/utils/styles/table_style.dart';

class TicketsListTable extends StatelessWidget {
  const TicketsListTable({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Container(
            color: Colors.white,
            // height: 200,
            child: Center(
              child: Table(
                  columnWidths: {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(2),
                  },
                  border: TableStyles.tableBorder,
                  children: [
                    TableRow(children: [
                      TableStyles.tableCellHeader('Référence'),
                      TableStyles.tableCellHeader('Date'),
                      TableStyles.tableCellHeader('Client'),
                      TableStyles.tableCellHeader('Totale'),
                    ])
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
                          0: FlexColumnWidth(2),
                          1: FlexColumnWidth(2),

                          //0: IntrinsicColumnWidth(), // i want this one to take the rest available space
                        },
                        border: TableStyles.tableBorder,
                        children: [
                          TableRow(children: [
                            TableStyles.tableCellArticle('6154885525445'),
                            TableStyles.tableCellArticle('15 / 02 / 1997'),
                            TableStyles.tableCellArticle('Ahmed Ahmed'),
                            TableStyles.tableCellArticle('140.50'),
                          ])
                        ])),
              );
            },
            itemCount: 15,
          ),
        ),
      ],
    );
  }
}

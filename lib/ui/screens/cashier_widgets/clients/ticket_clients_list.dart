import 'package:flutter/material.dart';
import 'package:pos_v1/ui/screens/widgets/tables/table_styles.dart';
import 'package:pos_v1/ui/utils/styles/input_style.dart';
import 'package:pos_v1/ui/utils/styles/table_style.dart';
import 'package:pos_v1/ui/utils/styles/text_style.dart';

class TicketClientsList extends StatefulWidget {
  @override
  _TicketClientsListState createState() => _TicketClientsListState();
}

class _TicketClientsListState extends State<TicketClientsList> {
  final _formKey = GlobalKey<FormState>();
  String adresse = '';
  String nom = '';
  String tel = '';
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            child: Form(
              key: _formKey,
              child: Row(
                children: [
                  SizedBox(width: 20.0),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 20.0),
                        Text(
                          'Nom du client :',
                          style: TextsStyle.primaryTextStyle,
                        ),
                        TextFormField(
                          decoration: InputStyle.textInputDecoration
                              .copyWith(hintText: 'Nom'),
                          validator: (val) => val.isEmpty ? 'Nom' : null,
                          onChanged: (val) {
                            setState(() => nom = val);
                          },
                        ),
                        //SizedBox(height: 20.0),
                        Text(
                          'Numero de telephone:',
                          style: TextsStyle.primaryTextStyle,
                        ),
                        TextFormField(
                          decoration: InputStyle.textInputDecoration
                              .copyWith(hintText: 'Telephone'),
                          validator: (val) =>
                              val.isEmpty ? 'numero de telephone' : null,
                          onChanged: (val) {
                            setState(() => tel = val);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 20.0),
                      Text(
                        'Adresse du client:',
                        style: TextsStyle.primaryTextStyle,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        decoration: InputStyle.textInputDecoration
                            .copyWith(hintText: 'Adresse'),
                        validator: (val) => val.isEmpty ? 'Adresse' : null,
                        onChanged: (val) {
                          setState(() => adresse = val);
                        },
                      ),
                      //SizedBox(height: 20.0),
                      RaisedButton(
                        color: Color(0xffffc93c),
                        child: Text(
                          'Rechercher',
                          style: TextsStyle.primaryTextStyle
                              .copyWith(color: Colors.black54),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            //setState(() => loading = true);
                            // dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                            // if (result == null) {
                            //   setState(() {
                            //     loading = false;
                            //     error = 'Please enter a valid email';
                            //   });
                            // }
                          }
                        },
                      ),
                    ],
                  )),
                  SizedBox(width: 20.0),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 20.0),
                Card(
                  child: Container(
                    color: Colors.white,
                    // height: 200,
                    child: Center(
                      child: Table(
                          columnWidths: {
                            0: FlexColumnWidth(),
                            1: FlexColumnWidth(),
                            2: FlexColumnWidth(),
                            3: FlexColumnWidth(),
                            //0: IntrinsicColumnWidth(), // i want this one to take the rest available space
                          },
                          border: TableStyles.tableBorder,
                          children: [
                            TableRow(children: [
                              TableStyles.tableCellHeader('Référence'),
                              TableStyles.tableCellHeader('Nom'),
                              TableStyles.tableCellHeader('Telephone'),
                              TableStyles.tableCellHeader('Adresse'),
                            ])
                          ]),
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                            child: Table(
                                columnWidths: {
                                  0: FlexColumnWidth(),
                                  1: FlexColumnWidth(),
                                  2: FlexColumnWidth(),
                                  3: FlexColumnWidth(),
                                  //0: IntrinsicColumnWidth(), // i want this one to take the rest available space
                                },
                                border: TableStyles.tableBorder,
                                children: [
                                  TableRow(children: [
                                    TableStyles.tableCellArticle(
                                        '6154885525445'),
                                    TableStyles.tableCellArticle('Elayachi'),
                                    TableStyles.tableCellArticle('06612522545'),
                                    TableStyles.tableCellArticle(
                                        'Lot afaddd casablanca n25'),
                                  ])
                                ])),
                      );
                    },
                    itemCount: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

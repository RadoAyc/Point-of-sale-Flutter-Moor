import 'package:flutter/material.dart';
import 'package:pos_v1/ui/screens/widgets/forms/search_form.dart';
import 'package:pos_v1/ui/screens/widgets/tables/ticket_display_table.dart';

class TicketRappelSearch extends StatefulWidget {
  @override
  _TicketRappelSearchState createState() => _TicketRappelSearchState();
}

class _TicketRappelSearchState extends State<TicketRappelSearch> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: SearchForm()),
        Divider(),
        Expanded(flex: 3, child: TicketDisplayTable())
      ],
    );
  }
}

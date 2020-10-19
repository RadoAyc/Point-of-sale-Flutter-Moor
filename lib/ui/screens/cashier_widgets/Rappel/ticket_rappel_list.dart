import 'package:flutter/material.dart';
import 'package:pos_v1/ui/screens/widgets/tables/tickets_list_table.dart';

class TicketRappelList extends StatefulWidget {
  @override
  _TicketRappelListState createState() => _TicketRappelListState();
}

class _TicketRappelListState extends State<TicketRappelList> {
  @override
  Widget build(BuildContext context) {
    return TicketsListTable();
  }
}

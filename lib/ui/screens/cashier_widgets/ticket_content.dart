import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pos_v1/ui/screens/widgets/tables/ticket_display_table.dart';

class TicketContent extends StatefulWidget {
  @override
  _TicketContentState createState() => _TicketContentState();
}

class _TicketContentState extends State<TicketContent> {
  _TicketContentState();

  @override
  Widget build(BuildContext context) {
    return TicketDisplayTable();
  }
}

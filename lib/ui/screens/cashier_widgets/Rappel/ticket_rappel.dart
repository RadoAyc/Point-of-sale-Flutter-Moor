import 'package:flutter/material.dart';
import 'package:pos_v1/ui/screens/cashier_widgets/Rappel/ticket_rappel_list.dart';
import 'package:pos_v1/ui/screens/cashier_widgets/Rappel/ticket_rappel_search.dart';
import 'package:pos_v1/ui/utils/size_config.dart';

class TicketRappel extends StatefulWidget {
  @override
  _TicketRappelState createState() => _TicketRappelState();
}

class _TicketRappelState extends State<TicketRappel> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topLeft,
                  color: Color(0xffc87941),
                  child: TicketRappelSearch(),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Color(0xffdbcbbd),
                  child: TicketRappelList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_v1/ui/screens/widgets/forms/search_form.dart';
import 'package:pos_v1/ui/screens/widgets/tables/tickets_list_table.dart';

import 'package:pos_v1/ui/utils/size_config.dart';

class TicketOnHold extends StatefulWidget {
  @override
  _TicketOnHoldState createState() => _TicketOnHoldState();
}

class _TicketOnHoldState extends State<TicketOnHold> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Row(
            children: [
              Container(
                alignment: Alignment.topLeft,

                color: Color(0xffff8e6e),
                padding: EdgeInsets.all(20),
                width: SizeConfig.screenWidth / 4,
                // height: SizeConfig.screenHeight,
                child: SearchForm(),
              ),
              Expanded(
                //width: SizeConfig.screenWidth / 5,
                child: Container(
                  color: Color(0xffffbb91),
                  child: TicketsListTable(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

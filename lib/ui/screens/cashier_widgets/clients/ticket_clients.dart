import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_v1/ui/screens/cashier_widgets/clients/ticket_clients_list.dart';
import 'package:pos_v1/ui/screens/cashier_widgets/clients/ticket_clients_search.dart';
import 'package:pos_v1/ui/utils/size_config.dart';

class TicketClients extends StatefulWidget {
  @override
  _TicketClientsState createState() => _TicketClientsState();
}

class _TicketClientsState extends State<TicketClients> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color: Colors.blueAccent,
          child: Row(
            children: [
              Expanded(
                //width: SizeConfig.screenWidth / 5,
                child: Container(
                  color: Color(0xffa2d5f2),
                  child: TicketClientsList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

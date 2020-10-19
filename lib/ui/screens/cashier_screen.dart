import 'package:flutter/material.dart';
import 'package:pos_v1/ui/screens/cashier_widgets/ticket_calculator.dart';
import 'package:pos_v1/ui/screens/cashier_widgets/ticket_content.dart';
import 'package:pos_v1/ui/screens/cashier_widgets/ticket_family.dart';
import 'package:pos_v1/ui/screens/cashier_widgets/ticket_family_products.dart';
import 'package:pos_v1/ui/screens/cashier_widgets/ticket_header_widgets.dart';
import 'package:pos_v1/ui/screens/cashier_widgets/ticket_settings.dart';
import 'package:pos_v1/ui/screens/cashier_widgets/ticket_validate.dart';
import 'package:pos_v1/ui/utils/size_config.dart';

class CashierPage extends StatefulWidget {
  @override
  _CashierPageState createState() => _CashierPageState();
}

class _CashierPageState extends State<CashierPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.lightBlueAccent[100],
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: SizeConfig.screenWidth / 3,
                    color: Colors.amber,
                    child: TicketHeader(),
                  ),
                  Expanded(
                    child: Container(
                      width: SizeConfig.screenWidth / 3,
                      color: Colors.amber[50],
                      child: TicketContent(),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: SizeConfig.screenWidth / 3,
                    height: SizeConfig.screenHeight * 0.3,
                    child: TicketSettings(),
                  ),
                  Expanded(
                    child: Container(
                      width: SizeConfig.screenWidth / 3,
                      color: Colors.indigo,
                      child: TicketCalculator(),
                    ),
                  ),
                  Container(
                    height: SizeConfig.screenHeight / 10,
                    width: SizeConfig.screenWidth / 3,
                    child: TicketValidate(),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: SizeConfig.screenWidth / 3,
                    height: SizeConfig.screenHeight * 0.3,
                    color: Colors.white,
                    child: TicketFamily(),
                  ),
                  Expanded(
                    child: Container(
                      width: SizeConfig.screenWidth / 3,
                      //height: SizeConfig.screenHeight * 0.6,
                      color: Colors.teal,
                      child: TicketFamilyProducts(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

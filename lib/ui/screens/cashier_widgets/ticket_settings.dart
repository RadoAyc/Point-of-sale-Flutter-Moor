import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pos_v1/ui/screens/cashier_widgets/Rappel/ticket_rappel.dart';
import 'package:pos_v1/ui/screens/cashier_widgets/clients/ticket_clients.dart';
import 'package:pos_v1/ui/screens/cashier_widgets/hold_ticket/ticket_onHold.dart';
import 'package:pos_v1/ui/screens/widgets/buttons/button_icon_text.dart';

class TicketSettings extends StatefulWidget {
  TicketSettings({Key key}) : super(key: key);

  @override
  _TicketSettingsState createState() => _TicketSettingsState();
}

class _TicketSettingsState extends State<TicketSettings> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ButtonIconText(
                  color: Color(0xff7fdbda),
                  text: 'Mise en attente',
                  function: () {},
                  icon: Icons.add_alarm),
              ButtonIconText(
                  color: Color(0xffade498),
                  text: 'Ticket en attente',
                  function: () {
                    Get.to(TicketOnHold());
                  },
                  icon: Icons.assignment),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ButtonIconText(
                  color: Color(0xffede682),
                  text: 'Les clients',
                  function: () {
                    Get.to(TicketClients());
                  },
                  icon: Icons.people),
              ButtonIconText(
                  color: Color(0xfffebf63),
                  text: 'Rappel',
                  function: () {
                    Get.to(TicketRappel());
                  },
                  icon: Icons.book),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ButtonIconText(
                color: Color(0xfff6ab6c),
                text: 'Dernier ticket',
                function: () {},
                icon: FontAwesomeIcons.print,
              ),
              ButtonIconText(
                color: Color(0xffe5edb7),
                text: 'Annuler ticket',
                function: () {},
                icon: FontAwesomeIcons.trashAlt,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

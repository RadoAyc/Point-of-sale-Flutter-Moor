import 'package:flutter/material.dart';
import 'package:pos_v1/ui/screens/widgets/buttons/button_row_icon_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pos_v1/ui/utils/styles/color_style.dart';

class TicketValidate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ButtonRowIconText(
          color: ColorStyle.validateColor,
          text: 'Valider',
          function: () {},
          icon: FontAwesomeIcons.check,
        ),
        ButtonRowIconText(
          color: ColorStyle.cancelColor,
          text: 'Encaissement direct',
          function: () {},
          icon: FontAwesomeIcons.ticketAlt,
        ),
      ],
    );
  }
}

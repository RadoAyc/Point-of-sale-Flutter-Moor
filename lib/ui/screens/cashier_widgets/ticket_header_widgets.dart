import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pos_v1/ui/utils/size_config.dart';
import 'dart:async';

import 'package:pos_v1/ui/utils/styles/text_style.dart';

class TicketHeader extends StatefulWidget {
  const TicketHeader({
    Key key,
  }) : super(key: key);

  @override
  _TicketHeaderState createState() => _TicketHeaderState();
}

class _TicketHeaderState extends State<TicketHeader> {
  String _timeString;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2),
      child: Wrap(
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal),
            child: Text(
              'Logo.png',
              style: TextStyle(fontSize: 22.0),
            ),
          ),
          SizedBox(
            child: AutoSizeText(
              'Adresse : aaaaaa xxxxxxxxxxxx vbbvb dfgdf dfgxcx aaaaa gbbbhh vccxvcv vbbgfhh',
              style: TextsStyle.secondaryTextStyle,
              maxLines: 3,
            ),
          ),
          AutoSizeText(
            'Tel : 0610203040',
            style: TextsStyle.secondaryTextStyle,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Date :    ',
                    style: TextsStyle.primaryTextStyle,
                  ),
                  Text(
                    _timeString,
                    style: TextsStyle.secondaryTextStyle,
                  ),
                ],
              ),
              //Spacer(),
              AutoSizeText(
                'Caissier :',
                style: TextsStyle.primaryTextStyle,
                maxLines: 2,
              ),
              SizedBox(
                width: SizeConfig.screenWidth / 12,
                height: SizeConfig.blockSizeHorizontal * 4,
                child: AutoSizeText(
                  'Mohammed Abdellah',
                  style: TextsStyle.primaryTextStyle,
                  maxLines: 2,
                ),
              )
            ],
          ),
          AutoSizeText(
            'Référence :',
            style: TextsStyle.secondaryTextStyle,
          ),
          // Text(
          //   'Logo.png',
          //   style: TextStyle(fontSize: 22.0),
          // ),
        ],
      ),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('''dd/mm/yyyy
  hh:mm:ss''').format(dateTime);
  }
}

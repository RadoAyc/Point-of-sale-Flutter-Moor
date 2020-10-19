import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:pos_v1/ui/utils/styles/input_style.dart';
import 'package:pos_v1/ui/utils/styles/text_style.dart';

class AdminRecipeSearchForm extends StatefulWidget {
  @override
  _AdminRecipeSearchFormState createState() => _AdminRecipeSearchFormState();
}

class _AdminRecipeSearchFormState extends State<AdminRecipeSearchForm> {
  final _formKey = GlobalKey<FormState>();
  String reference = '';
  DateTime dateFrom;
  DateTime dateTo;
  DateTime selectedDateFrom = DateTime.now();
  DateTime selectedDateTo = DateTime.now();
  final dateFormat = new DateFormat('dd-MM-yyyy');
  final timeFormat = new DateFormat('hh:mm');
  Future<Null> selectedTime24Hour;
/////////

  Future<Null> _selectDateFrom(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        locale: Locale('fr', ''),
        initialDatePickerMode: DatePickerMode.day,
        context: context,
        initialDate: selectedDateFrom,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDateFrom)
      setState(() {
        selectedDateFrom = picked;
        setState(() => dateFrom = picked);
      });
  }

  Future<Null> _selectDateTo(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        locale: Locale('fr', ''),
        initialDatePickerMode: DatePickerMode.day,
        context: context,
        initialDate: selectedDateTo,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDateTo)
      setState(() {
        selectedDateTo = picked;
        setState(() => dateTo = picked);
      });
  }

/////////

  String timeValueFrom = '00:00';
  TimeOfDay selectedTimeFrom = TimeOfDay.now();

  Future<Null> _timeFrom(BuildContext context) async {
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: 00, minute: 00),
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });

    if (picked_s != null && picked_s != selectedTimeFrom)
      setState(() {
        selectedTimeFrom = picked_s;
        timeValueFrom =
            picked_s.format(context); //time convert into string formate
      });
  }

/////////

/////////

  String timeValueTo = '23:59';
  TimeOfDay selectedTimeTo = TimeOfDay.now();

  Future<Null> _timeTo(BuildContext context) async {
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: 00, minute: 00),
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });

    if (picked_s != null && picked_s != selectedTimeTo)
      setState(() {
        selectedTimeTo = picked_s;
        timeValueTo =
            picked_s.format(context); //time convert into string formate
      });
  }

/////////
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Wrap(
        runSpacing: 10,
        children: [
          Text(
            'Référence:',
            style: TextsStyle.primaryTextStyle,
          ),
          TextFormField(
            decoration:
                InputStyle.textInputDecoration.copyWith(hintText: 'Référence'),
            validator: (val) => val.isEmpty ? 'Référence' : null,
            onChanged: (val) {
              setState(() => reference = val);
            },
          ),
          Text(
            'Date de début:',
            style: TextsStyle.primaryTextStyle,
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  onPressed: () => _selectDateFrom(context),
                  child: Text(
                    dateFormat.format(selectedDateFrom),
                    style: TextsStyle.primaryTextStyle.copyWith(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  onPressed: () => _timeFrom(context),
                  child: Text(
                    timeValueFrom,
                    style: TextsStyle.primaryTextStyle.copyWith(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
          Text(
            'Date de fin:',
            style: TextsStyle.primaryTextStyle,
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  onPressed: () => _selectDateTo(context),
                  child: Text(
                    dateFormat.format(selectedDateTo),
                    style: TextsStyle.primaryTextStyle.copyWith(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  onPressed: () => _timeTo(context),
                  child: Text(
                    timeValueTo,
                    style: TextsStyle.primaryTextStyle.copyWith(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: RaisedButton(
              color: Color(0xff515070),
              child: Text(
                'Rechercher',
                style: TextsStyle.primaryTextStyle
                    .copyWith(color: Color(0xfff6f6f6)),
              ),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  //setState(() => loading = true);
                  // dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                  // if (result == null) {
                  //   setState(() {
                  //     loading = false;
                  //     error = 'Please enter a valid email';
                  //   });
                  // }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

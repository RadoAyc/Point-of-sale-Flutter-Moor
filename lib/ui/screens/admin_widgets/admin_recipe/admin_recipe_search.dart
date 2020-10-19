import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:pos_v1/ui/screens/widgets/forms/search_form.dart';
import 'package:pos_v1/ui/screens/widgets/tables/ticket_display_table.dart';

class AdminRecipeSearch extends StatefulWidget {
  @override
  _AdminRecipeSearchState createState() => _AdminRecipeSearchState();
}

class _AdminRecipeSearchState extends State<AdminRecipeSearch> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: SearchForm()),
        Divider(),
        Expanded(
          child: TicketDisplayTable(),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pos_v1/ui/utils/styles/input_style.dart';
import 'package:pos_v1/ui/utils/styles/text_style.dart';

class TicketClientsSearch extends StatefulWidget {
  @override
  _TicketClientsSearchState createState() => _TicketClientsSearchState();
}

class _TicketClientsSearchState extends State<TicketClientsSearch> {
  final _formKey = GlobalKey<FormState>();
  String reference = '';
  String nom = '';
  String tel = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //physics: AlwaysScrollableScrollPhysics(),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 20.0),
                  Text(
                    'Référence:',
                    style: TextsStyle.primaryTextStyle,
                  ),
                  TextFormField(
                    decoration: InputStyle.textInputDecoration
                        .copyWith(hintText: 'Référence'),
                    validator: (val) => val.isEmpty ? 'Référence' : null,
                    onChanged: (val) {
                      setState(() => reference = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Nom du client :',
                    style: TextsStyle.primaryTextStyle,
                  ),
                  TextFormField(
                    decoration: InputStyle.textInputDecoration
                        .copyWith(hintText: 'Nom'),
                    validator: (val) => val.isEmpty ? 'Nom' : null,
                    onChanged: (val) {
                      setState(() => nom = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Numero de telephone:',
                    style: TextsStyle.primaryTextStyle,
                  ),
                  TextFormField(
                    decoration: InputStyle.textInputDecoration
                        .copyWith(hintText: 'Telephone'),
                    validator: (val) =>
                        val.isEmpty ? 'numero de telephone' : null,
                    onChanged: (val) {
                      setState(() => tel = val);
                    },
                  ),
                  SizedBox(height: 40.0),
                  RaisedButton(
                    color: Color(0xffffc93c),
                    child: Text(
                      'Rechercher',
                      style: TextsStyle.primaryTextStyle
                          .copyWith(color: Colors.black54),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

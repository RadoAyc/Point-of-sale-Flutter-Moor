import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pos_v1/ui/screens/cashier_screen.dart';
import 'package:pos_v1/ui/utils/size_config.dart';
import 'package:pos_v1/ui/utils/styles/input_style.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  // text field State

  String email = '';
  String password = '';

  String error = '';
// Drop List

  List<String> _locations = [
    'Admin',
    'Caissier 1',
    'Caissier 2',
    'Caissier 3'
  ]; // Option 2
  String _selectedLocation; // Option 2

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xff28df99),
          child: Center(
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  offset: const Offset(3.0, 3.0),
                  blurRadius: 30.0,
                  spreadRadius: 0.2,
                ),
              ]),
              child: Card(
                  color: Color(0xff99f3bd),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.vertical,
                    spacing: 20,
                    children: [
                      Container(
                        padding: EdgeInsets.all(50.0),
                        decoration: BoxDecoration(
                            color: Color(0xff28df99), shape: BoxShape.circle),
                        child: FaIcon(
                          FontAwesomeIcons.userTie,
                          size: SizeConfig.screenWidth / 10,
                          color: Color(0xfff6f7d4),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        width: SizeConfig.screenWidth / 3,
                        child: Form(
                          key: _formKey,
                          child: Wrap(
                            runSpacing: 20,
                            alignment: WrapAlignment.center,
                            // spacing: 20,
                            children: <Widget>[
                              SizedBox(height: 20.0),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0, style: BorderStyle.solid),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isExpanded: true,

                                    dropdownColor: Colors.white,
                                    hint: Text(
                                        'Utilisateur :'), // Not necessary for Option 1
                                    value: _selectedLocation,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedLocation = newValue;
                                      });
                                    },
                                    items: _locations.map((location) {
                                      return DropdownMenuItem(
                                        child: new Text(location),
                                        value: location,
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                decoration: InputStyle.textInputDecoration
                                    .copyWith(hintText: 'Password'),
                                validator: (val) => val.length < 6
                                    ? 'Enter a password 6+ chars length'
                                    : null,
                                obscureText: true,
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                              ),
                              SizedBox(height: 20.0),
                              RaisedButton(
                                color: Color(0xffffffdd),
                                child: Text(
                                  'SignIn',
                                  // style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  Get.to(CashierPage());
                                  //  if (_formKey.currentState.validate()) {
                                  //    setState(() => loading = true);
                                  //    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                                  //     if (result == null) {
                                  //       setState(() {
                                  //         error = 'Could not Sign in with those credentials';
                                  //         loading = false;
                                  //       });
                                  //     }
                                  // }
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                error,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 14.0),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

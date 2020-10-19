import 'package:flutter/material.dart';
import 'package:circular_menu/circular_menu.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          RaisedButton(child: Text('Ajuter nouveau Produit'), onPressed: () {}),
        ],
      )),
    );
  }
}

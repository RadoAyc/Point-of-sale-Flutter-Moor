import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TicketFamily extends StatefulWidget {
  @override
  _TicketFamilyState createState() => _TicketFamilyState();
}

class _TicketFamilyState extends State<TicketFamily> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(10),
      child: GridView.count(
        // padding: EdgeInsets.all(2),

        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        scrollDirection: Axis.horizontal,
        crossAxisCount: 2,
        children: List.generate(7, (index) {
          return Stack(children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                //margin: EdgeInsets.only(top: 40),
                child: Image.asset(
                  "assets/tint1.jpg",
                  // color: Colors.white,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                verticalDirection: VerticalDirection.up,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.black.withOpacity(.4),
                    child: Text(
                      "title",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
            ),
          ]);
        }),
      ),
    ));
  }
}

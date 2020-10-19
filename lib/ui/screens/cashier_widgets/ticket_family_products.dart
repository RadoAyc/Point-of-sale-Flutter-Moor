import 'package:flutter/material.dart';
import 'package:pos_v1/ui/utils/size_config.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TicketFamilyProducts extends StatefulWidget {
  @override
  _TicketFamilyProductsState createState() => _TicketFamilyProductsState();
}

class _TicketFamilyProductsState extends State<TicketFamilyProducts> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return new StaggeredGridView.countBuilder(
      crossAxisCount: 8,
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) => new Container(
          color: Colors.green,
          child: new Center(
              child: new Card(
            child: new Column(
              children: <Widget>[
                new Stack(
                  children: <Widget>[
                    new Center(
                      child: Image.asset(
                        "assets/tint1.jpg",
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ],
                ),
                new Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Column(
                    children: <Widget>[
                      new Text(
                        'Image number $index',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      new Text(
                        'Width: ',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ))),
      staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pos_v1/back-end/controllers/products_cobtroller.dart';
import 'package:pos_v1/back-end/data/moor_database.dart';
import 'package:pos_v1/ui/screens/admin_widgets/admin_product/admin_product_list.dart';
import 'package:pos_v1/ui/screens/admin_widgets/admin_product/admin_product_search.dart';
import 'package:pos_v1/ui/screens/widgets/forms/search_form.dart';
import 'package:pos_v1/ui/screens/widgets/tables/table_widgets.dart';
import 'package:provider/provider.dart';
import 'package:pos_v1/ui/screens/widgets/tables/table_styles.dart';

class ShowProduct extends StatefulWidget {
  ShowProduct({Key key}) : super(key: key);

  @override
  _ShowProductState createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Container(child: AdminProductSearch()),
            Expanded(
                child: ChangeNotifierProvider(
                    create: (context) => ProductsController(),
                    child: AdminProductsList()))
          ],
        ),
      )),
    );
  }
}

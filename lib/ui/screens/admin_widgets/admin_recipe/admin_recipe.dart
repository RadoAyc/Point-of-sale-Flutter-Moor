import 'package:flutter/material.dart';
import 'package:pos_v1/ui/screens/admin_widgets/admin_recipe/admin_recipe_search.dart';
import 'package:pos_v1/ui/screens/admin_widgets/admin_recipe/admin_recipe_search_total.dart';
import 'package:pos_v1/ui/screens/widgets/cards/rounded_card_display.dart';
import 'package:pos_v1/ui/screens/widgets/tables/tickets_list_table.dart';
import 'package:pos_v1/ui/utils/size_config.dart';

class AdminRecipe extends StatefulWidget {
  @override
  _AdminRecipeState createState() => _AdminRecipeState();
}

class _AdminRecipeState extends State<AdminRecipe> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color: Colors.blueAccent,
          child: Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                color: Color(0xffd9adad),
                width: SizeConfig.screenWidth / 3,
                // height: SizeConfig.screenHeight,
                child: AdminRecipeSearch(),
              ),
              Expanded(
                //width: SizeConfig.screenWidth / 5,
                child: Container(
                  color: Color(0xfffccbcb),
                  child: Column(
                    children: [
                      Expanded(flex: 8, child: TicketsListTable()),
                      Expanded(flex: 1, child: AdminRecipeSearchTotal())
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

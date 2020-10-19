import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_v1/back-end/controllers/products_cobtroller.dart';
import 'package:pos_v1/ui/screens/admin_widgets/admin_product/admin_add_product.dart';
import 'package:pos_v1/ui/screens/admin_widgets/admin_product/admin_product_search.dart';
import 'package:pos_v1/ui/screens/admin_widgets/admin_product/admin_product_show.dart';
import 'package:pos_v1/ui/screens/admin_widgets/admin_recipe/admin_recipe.dart';
import 'package:pos_v1/ui/screens/admin_widgets/admin_screen.dart';
import 'package:pos_v1/ui/screens/cashier_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pos_v1/ui/screens/cashier_widgets/Rappel/ticket_rappel.dart';
import 'package:pos_v1/ui/screens/cashier_widgets/Rappel/ticket_rappel_search.dart';
import 'package:pos_v1/ui/screens/cashier_widgets/clients/ticket_clients.dart';
import 'package:pos_v1/ui/screens/cashier_widgets/hold_ticket/ticket_onHold.dart';
import 'package:pos_v1/ui/screens/login_widgets/login_screen.dart';
import 'package:provider/provider.dart';

import 'back-end/data/moor_database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProductDao>(create: (_) => AppDatabase().productDao),
        // ListenableProvider<ProductsController>(
        //     create: (_) => ProductsController()),

        // create: (_) => AppDatabase().productDao,
      ],
      child: GetMaterialApp(
        localizationsDelegates: [
          // ... app-specific localization delegate[s] here
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('fr', ''), // English, no country code
          // ... other locales the app supports
        ],
        home: ShowProduct(),
      ),
    );
  }
}

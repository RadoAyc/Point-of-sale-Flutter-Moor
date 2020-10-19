import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:pos_v1/back-end/data/moor_database.dart';
// import 'package:pos_v1/back-end/models/products_model.dart';

class ProductsController extends ChangeNotifier {
  StreamController<Products> productList = StreamController<Products>();
  Stream pList;
  double prixAchatmin = 10;
  double prixAchatmax = 100;

  notifyListeners();

  /// close stream = onClose method, not dispose.
//   @override
//   void onClose() {
//     productList.close();
//     super.onClose();
//   }
// }
// @override
// void onInit() {
//   _dbGetProductsList();
//   super.onInit();
// }

// void _dbGetProductsList() {
//   Future.delayed(Duration.zero, ()=> Get.
}

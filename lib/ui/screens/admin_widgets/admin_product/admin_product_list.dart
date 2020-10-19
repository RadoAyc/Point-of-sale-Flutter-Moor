import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_v1/back-end/controllers/product_controller.dart';
import 'package:pos_v1/back-end/controllers/products_cobtroller.dart';
import 'package:pos_v1/back-end/data/moor_database.dart';
import 'package:pos_v1/back-end/controllers/search_form.dart';
import 'package:pos_v1/ui/screens/widgets/tables/table_styles.dart';
import 'package:provider/provider.dart';

class AdminProductsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            color: Color(0xffebd4d4),
            child: Container(
              child: Center(
                child: Table(border: TableStyles.tableBorder, columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),

                  //0: IntrinsicColumnWidth(), // i want this one to take the rest available space
                }, children: [
                  TableRow(children: [
                    TableStyles.tableCellHeader('Reference'),
                    TableStyles.tableCellHeader('designation'),
                    TableStyles.tableCellHeader('Prix d\'achat'),
                    TableStyles.tableCellHeader('Prix de vente'),
                    TableStyles.tableCellHeader('Quantité'),
                    TableStyles.tableCellHeader('TVA'),
                    TableStyles.tableCellHeader('Famille'),
                    TableStyles.tableCellHeader('Fournisseur'),
                  ])
                ]),
              ),
            ),
          ),
          Expanded(
              child: GetX<PructController>(
            init: Get.put<PructController>(PructController()),
            builder: (PructController pController) {
              return ListView.builder(
                itemCount: pController.todos.length,
                itemBuilder: (_, index) {
                  final itemProduct = pController.todos[index];
                  return Text(itemProduct.designation);
                },
              );
            },
          )
              // _buildProductList(context)
              ),
        ],
      ),
    );
  }
}

// Widget _buildProductList(BuildContext context) {
//   final dao = Provider.of<ProductDao>(context);
//   Obx(
//     () => ListView.builder(
//       itemCount: 1,
//       itemBuilder: (BuildContext context, int index) {
//         return;
//       },
//     ),
//   );
// }

// _buildList(BuildContext context) {
//       final dao = Provider.of<ProductDao>(context, listen: false);

//   GetX<PructController>(

//     builder: (controller) {
//       return StreamBuilder(builder: dao.watchBetweenPriceProducts)
//     },
//   );
// }

StreamBuilder<List<Product>> _buildProductList(BuildContext context) {
  final dao = Provider.of<ProductDao>(context, listen: false);
  final p = Provider.of<ProductsController>(context, listen: false);
  final SearchForm c = Get.put(SearchForm());
  final pructController = Get.put(PructController());

  print("*********************Display section ************************* ");

  print(pructController.prixAchat);
  print(pructController.prixVente);

  print("*********************Display section ************************* ");

  return StreamBuilder(
    stream: dao.watchBetweenPriceProducts(
      // 33.50,
      pructController.prixAchat,
      pructController.prixVente,

      // 50.50
    ),
    builder: (context, AsyncSnapshot<List<Product>> snapshot) {
      final products = snapshot.data ?? List();

      return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final itemProduct = products[index];
          return _buildListItem(itemProduct, dao);
        },
      );
    },
  );
}

Widget _buildListItem(Product itemTask, ProductDao dao) {
  return Card(
    color: Color(0xfffff0f0),
    child: Table(
      border: TableStyles.tableBorder,
      columnWidths: {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
      children: [
        TableRow(children: [
          InkWell(
            onTap: () => dao.deleteProduct(itemTask),
            child: TableStyles.tableCellArticle(itemTask.reference.toString()),
          ),
          TableStyles.tableCellArticle(itemTask.designation),
          TableStyles.tableCellArticle(itemTask.prixAchat.toString()),
          TableStyles.tableCellArticle(itemTask.prixVente.toString()),
          TableStyles.tableCellArticle(itemTask.quantite.toString()),
          TableStyles.tableCellArticle(itemTask.tva.toString()),
          TableStyles.tableCellArticle(itemTask.famille),
          TableStyles.tableCellArticle(itemTask.fournisseur),
        ])
      ],
    ),
  );
}

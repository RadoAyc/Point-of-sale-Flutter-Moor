import 'package:get/get.dart';
import 'package:pos_v1/back-end/models/products_model.dart';
import 'package:provider/provider.dart';
import 'package:pos_v1/back-end/data/moor_database.dart';

class PructController extends GetxController {
  // var products = List<Productss>().obs;
  Rx<List<Product>> products = Rx<List<Product>>();
  List<Product> get todos => products.value;

  double _prixAchat;

  double get prixAchat => _prixAchat;

  set prixAchat(double prixAchat) {
    _prixAchat = prixAchat;
  }

  double _prixVente;

  double get prixVente => _prixVente;

  set prixVente(double prixVente) {
    _prixVente = prixVente;
  }

  @override
  void onInit() {
    super.onInit();
    // fetchProducts();
  }

  void fetchProducts(double a, double b) async {
    products
        .bindStream(ProductDao(AppDatabase()).watchBetweenPriceProducts(a, b));
  }
}

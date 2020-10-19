import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Products extends Table {
  IntColumn get reference => integer()();
  TextColumn get designation => text()();
  RealColumn get prixAchat => real()();
  RealColumn get prixVente => real()();
  IntColumn get quantite => integer()();
  RealColumn get tva => real()();
  TextColumn get famille => text()();
  TextColumn get fournisseur => text()();

  @override
  Set<Column> get primaryKey => {reference};
}

@UseMoor(tables: [Products], daos: [ProductDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          // Good for debugging - prints SQL in the console
          logStatements: true,
        )));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [Products])
class ProductDao extends DatabaseAccessor<AppDatabase> with _$ProductDaoMixin {
  final AppDatabase db;

  ProductDao(this.db) : super(db);

  Future<List<Product>> getAllProducts() => select(products).get();

  Stream<List<Product>> watchAllProducts() => select(products).watch();

  Stream<List<Product>> watchOrderedProducts() {
    // Wrap the whole select statement in parenthesis
    return (select(products)
          // Statements like orderBy and where return void => the need to use a cascading ".." operator
          ..orderBy(
            ([
              // Primary sorting by due date
              (t) => OrderingTerm(
                  expression: t.prixAchat, mode: OrderingMode.desc),
              // Secondary alphabetical sorting
              (t) => OrderingTerm(
                  expression: t.prixVente, mode: OrderingMode.desc),
            ]),
          ))
        // watch the whole select statement
        .watch();
  }

  Stream<List<Product>> watchBetweenPriceProducts(
      double prixAchatMin, double prixAchatMax) {
    // Wrap the whole select statement in parenthesis
    return (select(products)
          // Statements like orderBy and where return void => the need to use a cascading ".." operator
          ..where((tbl) =>
              tbl.prixAchat.isBetweenValues(prixAchatMin, prixAchatMax)))
        // watch the whole select statement
        .watch();
  }

  Future insertProduct(Insertable<Product> product) =>
      into(products).insert(product);

  Future updateProduct(Insertable<Product> product) =>
      update(products).replace(product);

  Future deleteProduct(Insertable<Product> product) =>
      delete(products).delete(product);
}

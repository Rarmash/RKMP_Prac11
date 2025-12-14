import '../models/product.dart';

abstract class ProductsRepository {
  List<Product> getProducts();
  Product? findById(int id);

  void remove(int id);
  void addOrRestock({required int id, required String name, required int qty});
  bool order(int id, int qty);
}

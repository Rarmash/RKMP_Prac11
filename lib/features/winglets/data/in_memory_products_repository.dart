import '../data/app_data.dart';
import '../domain/models/product.dart';
import '../domain/repositories/products_repository.dart';

class InMemoryProductsRepository implements ProductsRepository {
  final AppData data;
  InMemoryProductsRepository(this.data);

  @override
  List<Product> getProducts() => data.products;

  @override
  Product? findById(int id) => data.findProduct(id);

  @override
  void remove(int id) => data.removeProduct(id);

  @override
  void addOrRestock({required int id, required String name, required int qty}) {
    data.addOrRestock(id: id, name: name, qty: qty);
  }

  @override
  bool order(int id, int qty) => data.orderProduct(id, qty);
}

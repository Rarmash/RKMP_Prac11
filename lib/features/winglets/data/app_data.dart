import '../models/order.dart';
import '../models/product.dart';

class AppData {
  String userName = 'Андрей Гришин';

  final List<Product> _products = [
    const Product(id: 1, name: 'Передний подкрылок', quantity: 25),
    const Product(id: 2, name: 'Задний подкрылок', quantity: 18),
    const Product(id: 3, name: 'Подкрылок левый', quantity: 12),
    const Product(id: 4, name: 'Подкрылок правый', quantity: 15),
    const Product(id: 5, name: 'Комплект подкрылков', quantity: 7),
  ];

  // история заказов
  final List<Order> _history = [];

  bool isDarkTheme = false;

  List<Product> get products => List.unmodifiable(_products);
  List<Order> get history => List.unmodifiable(_history);

  Product? findProduct(int id) {
    try {
      return _products.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  void addOrRestock({required int id, required String name, required int qty}) {
    final idx = _products.indexWhere((p) => p.id == id);
    if (idx >= 0) {
      final p = _products[idx];
      _products[idx] = p.copyWith(quantity: p.quantity + qty);
    } else {
      _products.add(Product(id: id, name: name, quantity: qty));
    }
  }

  void removeProduct(int id) {
    _products.removeWhere((p) => p.id == id);
  }

  bool orderProduct(int id, int qty) {
    final idx = _products.indexWhere((p) => p.id == id);
    if (idx < 0) return false;
    final p = _products[idx];
    if (qty <= 0 || qty > p.quantity) return false;
    _products[idx] = p.copyWith(quantity: p.quantity - qty);
    return true;
  }

  void addHistory(Order order) {
    _history.add(order);
  }

  Order? findOrder(String id) {
    try {
      return _history.firstWhere((o) => o.id == id);
    } catch (_) {
      return null;
    }
  }
}

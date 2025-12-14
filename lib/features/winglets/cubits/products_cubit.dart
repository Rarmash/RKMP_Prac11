import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/app_data.dart';
import '../models/product.dart';

class ProductsState extends Equatable {
  final List<Product> products;
  const ProductsState(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductsCubit extends Cubit<ProductsState> {
  final AppData data;
  ProductsCubit(this.data) : super(const ProductsState([]));

  void load() => emit(ProductsState(data.products));

  Product? findById(int id) => data.findProduct(id);

  void remove(int id) {
    data.removeProduct(id);
    load();
  }

  void addOrRestock({required int id, required String name, required int qty}) {
    data.addOrRestock(id: id, name: name, qty: qty);
    load();
  }

  bool order(int id, int qty) {
    final ok = data.orderProduct(id, qty);
    load();
    return ok;
  }
}

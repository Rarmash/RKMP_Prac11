import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/product.dart';
import '../../domain/repositories/products_repository.dart';

class ProductsState extends Equatable {
  final List<Product> products;
  const ProductsState(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepository repository;
  ProductsCubit(this.repository) : super(const ProductsState([]));

  void load() => emit(ProductsState(repository.getProducts()));

  Product? findById(int id) => repository.findById(id);

  void remove(int id) {
    repository.remove(id);
    load();
  }

  void addOrRestock({required int id, required String name, required int qty}) {
    repository.addOrRestock(id: id, name: name, qty: qty);
    load();
  }

  bool order(int id, int qty) {
    final ok = repository.order(id, qty);
    load();
    return ok;
  }
}

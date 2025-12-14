import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/order.dart';

class CartState extends Equatable {
  final Order? order;
  const CartState(this.order);

  @override
  List<Object?> get props => [order];
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState(null));

  void set(Order order) => emit(CartState(order));
  void clear() => emit(const CartState(null));
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/app_data.dart';
import '../models/order.dart';

class HistoryState extends Equatable {
  final List<Order> orders;
  const HistoryState(this.orders);

  @override
  List<Object?> get props => [orders];
}

class HistoryCubit extends Cubit<HistoryState> {
  final AppData data;
  HistoryCubit(this.data) : super(const HistoryState([]));

  void load() => emit(HistoryState(data.history));

  void add(Order order) {
    data.addHistory(order);
    load();
  }

  Order? findById(String id) => data.findOrder(id);
}

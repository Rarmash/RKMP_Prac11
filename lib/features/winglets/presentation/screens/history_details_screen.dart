import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubits/history_cubit.dart';
import '../../../../utils/format_utils.dart';

class HistoryDetailsScreen extends StatelessWidget {
  final String orderId;
  const HistoryDetailsScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HistoryCubit>();
    final order = cubit.findById(orderId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали заказа'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: order == null
          ? const Center(child: Text('Заказ не найден'))
          : Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Заказ №${order.id}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Товар: ${order.productName}'),
            Text('Количество: ${order.quantity}'),
            Text('Дата: ${formatDate(order.date)}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.push('/products/details/${order.productId}'),
              child: const Text('Открыть товар'),
            ),
          ],
        ),
      ),
    );
  }
}

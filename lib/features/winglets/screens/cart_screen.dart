import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubits/cart_cubit.dart';
import '../../../utils/format_utils.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final order = state.order;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Результат заказа'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.read<CartCubit>().clear();
                context.pushReplacement('/products');
              },
            ),
          ),
          body: order == null
              ? const Center(child: Text('Нет данных для отображения'))
              : Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Заказ успешно оформлен!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text('Товар: ${order.productName}', style: const TextStyle(fontSize: 18)),
                  Text('Количество: ${order.quantity}', style: const TextStyle(fontSize: 18)),
                  Text('Дата: ${formatDate(order.date)}', style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubits/cart_cubit.dart';
import '../cubits/history_cubit.dart';
import '../cubits/products_cubit.dart';
import '../../domain/models/order.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int? selectedId;
  final qtyController = TextEditingController();
  String? error;

  void _submit() {
    final qty = int.tryParse(qtyController.text) ?? 0;
    if (selectedId == null || qty <= 0) return;

    final productsCubit = context.read<ProductsCubit>();
    final p = productsCubit.findById(selectedId!);
    if (p == null) return;

    if (qty > p.quantity) {
      setState(() => error = 'Доступно только ${p.quantity} шт.');
      return;
    }

    final ok = productsCubit.order(p.id, qty);
    if (!ok) {
      setState(() => error = 'Невозможно оформить заказ.');
      return;
    }

    final order = Order(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      productId: p.id,
      productName: p.name,
      quantity: qty,
      date: DateTime.now(),
    );

    context.read<HistoryCubit>().add(order);
    context.read<CartCubit>().set(order);

    context.push('/cart');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Оформление заказа'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                DropdownButton<int>(
                  value: selectedId,
                  hint: const Text('Выберите товар'),
                  isExpanded: true,
                  items: state.products.map((p) {
                    return DropdownMenuItem(
                      value: p.id,
                      child: Text('${p.name} (остаток: ${p.quantity})'),
                    );
                  }).toList(),
                  onChanged: (v) => setState(() {
                    selectedId = v;
                    error = null;
                  }),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: qtyController,
                  decoration: const InputDecoration(
                    labelText: 'Количество',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                if (error != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(error!, style: const TextStyle(color: Colors.red)),
                  ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submit,
                  child: const Text('Оформить'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

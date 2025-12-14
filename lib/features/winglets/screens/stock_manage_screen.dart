import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubits/products_cubit.dart';

class StockManageScreen extends StatefulWidget {
  const StockManageScreen({super.key});

  @override
  State<StockManageScreen> createState() => _StockManageScreenState();
}

class _StockManageScreenState extends State<StockManageScreen> {
  final idCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final qtyCtrl = TextEditingController();
  String? info;

  void _addOrRestock() {
    final id = int.tryParse(idCtrl.text) ?? 0;
    final name = nameCtrl.text.trim();
    final qty = int.tryParse(qtyCtrl.text) ?? 0;

    if (id <= 0 || name.isEmpty || qty <= 0) return;

    context.read<ProductsCubit>().addOrRestock(id: id, name: name, qty: qty);

    setState(() => info = 'Товар обновлён: $name (+$qty)');
    idCtrl.clear();
    nameCtrl.clear();
    qtyCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Управление складом'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: idCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'ID товара'),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(labelText: 'Название'),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: qtyCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Количество'),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: _addOrRestock,
                  child: const Text('Добавить / Пополнить'),
                ),
                if (info != null) ...[
                  const SizedBox(height: 8),
                  Text(info!, textAlign: TextAlign.center),
                ],
                const Divider(height: 28),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (_, i) {
                      final p = state.products[i];
                      return ListTile(
                        title: Text('${p.name} (ID: ${p.id})'),
                        subtitle: Text('Остаток: ${p.quantity}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => context.read<ProductsCubit>().remove(p.id),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

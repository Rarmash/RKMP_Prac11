import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubits/products_cubit.dart';
import '../widgets/product_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        final q = ctrl.text.trim().toLowerCase();
        final filtered = state.products.where((p) {
          if (q.isEmpty) return true;
          return p.name.toLowerCase().contains(q) || p.id.toString() == q;
        }).toList();

        return Scaffold(
          appBar: AppBar(
            title: const Text('Поиск'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TextField(
                  controller: ctrl,
                  decoration: const InputDecoration(
                    labelText: 'Название или ID',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (_, i) => ProductTile(
                      product: filtered[i],
                      onTap: () => context.push('/products/details/${filtered[i].id}'),
                    ),
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

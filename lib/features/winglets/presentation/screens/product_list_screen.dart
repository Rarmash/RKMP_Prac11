import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubits/products_cubit.dart';
import '../widgets/product_tile.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Каталог подкрылков'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => context.push('/search'),
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, i) {
              final p = state.products[i];
              return ProductTile(
                product: p,
                onTap: () => context.push('/products/details/${p.id}'),
              );
            },
          ),
        );
      },
    );
  }
}

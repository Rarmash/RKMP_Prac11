import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../cubits/products_cubit.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int productId;
  const ProductDetailsScreen({super.key, required this.productId});

  String _getProductImageUrl(int id) {
    switch (id) {
      case 1:
        return 'https://avatars.mds.yandex.net/get-mpic/4267432/2a00000192e1b8f63620001e7e1a5f66d9b0/optimize';
      case 2:
        return 'https://avatars.mds.yandex.net/get-mpic/15269583/2a0000019a4d23454f6c5513775ae41c5e3d/optimize';
      case 3:
        return 'https://avatars.mds.yandex.net/get-mpic/1522540/2a00000197f3635802c8ab9c0f32488900cd/optimize';
      case 4:
        return 'https://avatars.mds.yandex.net/get-mpic/1930823/2a0000019248ecbcbb91e0d76660492391b9/optimize';
      case 5:
        return 'https://avatars.mds.yandex.net/get-mpic/12200529/2a0000018cee2810436ee79689e1e18b62dd/optimize';
      default:
        return 'https://avatars.mds.yandex.net/i?id=b89aab1fa0a115ab506ad87336234073_l-4271783-images-thumbs&n=13';
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsCubit>();
    final p = cubit.findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Карточка товара'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: p == null
          ? const Center(child: Text('Товар не найден'))
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: _getProductImageUrl(p.id),
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                    const Icon(
                      Icons.image_not_supported,
                      size: 80,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                p.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text('ID товара: ${p.id}'),
              Text('Остаток на складе: ${p.quantity} шт.'),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.push('/order'),
                  child: const Text('Оформить заказ'),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => context.push('/stock'),
                  child: const Text('Перейти на склад'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

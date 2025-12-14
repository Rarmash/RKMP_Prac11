import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Главное меню')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.list_alt),
            title: const Text('Каталог подкрылков'),
            onTap: () => context.push('/products'),
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Поиск'),
            onTap: () => context.push('/search'),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Оформление заказа'),
            onTap: () => context.push('/order'),
          ),
          ListTile(
            leading: const Icon(Icons.inventory),
            title: const Text('Склад'),
            onTap: () => context.push('/stock'),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('История заказов'),
            onTap: () => context.push('/history'),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Профиль'),
            onTap: () => context.push('/profile'),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Настройки'),
            onTap: () => context.push('/settings'),
          ),
        ],
      ),
    );
  }
}

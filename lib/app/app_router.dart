import 'package:go_router/go_router.dart';

import '../features/winglets/screens/main_menu_screen.dart';
import '../features/winglets/screens/product_list_screen.dart';
import '../features/winglets/screens/product_details_screen.dart';
import '../features/winglets/screens/order_screen.dart';
import '../features/winglets/screens/cart_screen.dart';
import '../features/winglets/screens/stock_manage_screen.dart';
import '../features/winglets/screens/history_screen.dart';
import '../features/winglets/screens/history_details_screen.dart';
import '../features/winglets/screens/profile_screen.dart';
import '../features/winglets/screens/settings_screen.dart';
import '../features/winglets/screens/search_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/main',
      name: 'main',
      builder: (context, state) => const MainMenuScreen(),
    ),
    GoRoute(
      path: '/products',
      name: 'products',
      builder: (context, state) => const ProductListScreen(),
      routes: [
        GoRoute(
          path: 'details/:id',
          name: 'product_details',
          builder: (context, state) =>
              ProductDetailsScreen(productId: int.parse(state.pathParameters['id']!)),
        ),
      ],
    ),
    GoRoute(
      path: '/search',
      name: 'search',
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/order',
      name: 'order',
      builder: (context, state) => const OrderScreen(),
    ),
    GoRoute(
      path: '/cart',
      name: 'cart',
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: '/stock',
      name: 'stock',
      builder: (context, state) => const StockManageScreen(),
    ),
    GoRoute(
      path: '/history',
      name: 'history',
      builder: (context, state) => const HistoryScreen(),
      routes: [
        GoRoute(
          path: 'details/:id',
          name: 'history_details',
          builder: (context, state) =>
              HistoryDetailsScreen(orderId: state.pathParameters['id']!),
        ),
      ],
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);

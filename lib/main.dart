import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/di.dart';
import 'app/app.dart';
import 'features/winglets/cubits/cart_cubit.dart';
import 'features/winglets/cubits/history_cubit.dart';
import 'features/winglets/cubits/products_cubit.dart';
import 'features/winglets/cubits/profile_cubit.dart';
import 'features/winglets/cubits/settings_cubit.dart';

void main() {
  setupDi();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ProductsCubit>()..load()),
        BlocProvider(create: (_) => getIt<CartCubit>()),
        BlocProvider(create: (_) => getIt<HistoryCubit>()..load()),
        BlocProvider(create: (_) => getIt<ProfileCubit>()..load()),
        BlocProvider(create: (_) => getIt<SettingsCubit>()..load()),
      ],
      child: const WingletsApp(),
    ),
  );
}

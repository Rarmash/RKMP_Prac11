import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/winglets/cubits/settings_cubit.dart';
import 'app_router.dart';

class WingletsApp extends StatelessWidget {
  const WingletsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return MaterialApp.router(
          title: 'Каталог подкрылков',
          theme: ThemeData(
            brightness: state.isDark ? Brightness.dark : Brightness.light,
            useMaterial3: true,
          ),
          routerConfig: appRouter,
        );
      },
    );
  }
}

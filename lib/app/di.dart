import 'package:get_it/get_it.dart';

import '../features/winglets/data/app_data.dart';
import '../features/winglets/cubits/cart_cubit.dart';
import '../features/winglets/cubits/history_cubit.dart';
import '../features/winglets/cubits/products_cubit.dart';
import '../features/winglets/cubits/profile_cubit.dart';
import '../features/winglets/cubits/settings_cubit.dart';

final getIt = GetIt.instance;

void setupDi() {
  getIt.registerLazySingleton<AppData>(() => AppData());

  getIt.registerFactory<ProductsCubit>(() => ProductsCubit(getIt<AppData>()));
  getIt.registerFactory<CartCubit>(() => CartCubit());
  getIt.registerFactory<HistoryCubit>(() => HistoryCubit(getIt<AppData>()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt<AppData>()));
  getIt.registerFactory<SettingsCubit>(() => SettingsCubit(getIt<AppData>()));
}

import 'package:get_it/get_it.dart';

import '../../features/winglets/data/app_data.dart';
import '../../features/winglets/data/in_memory_products_repository.dart';
import '../../features/winglets/domain/repositories/products_repository.dart';

import '../../features/winglets/presentation/cubits/products_cubit.dart';
import '../../features/winglets/presentation/cubits/cart_cubit.dart';
import '../../features/winglets/presentation/cubits/history_cubit.dart';
import '../../features/winglets/presentation/cubits/profile_cubit.dart';
import '../../features/winglets/presentation/cubits/settings_cubit.dart';

final getIt = GetIt.instance;

void setupDi() {
  getIt.registerLazySingleton<AppData>(() => AppData());

  getIt.registerLazySingleton<ProductsRepository>(
        () => InMemoryProductsRepository(getIt<AppData>()),
  );

  getIt.registerFactory<ProductsCubit>(
        () => ProductsCubit(getIt<ProductsRepository>()),
  );

  getIt.registerFactory<CartCubit>(() => CartCubit());
  getIt.registerFactory<HistoryCubit>(() => HistoryCubit(getIt<AppData>()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt<AppData>()));
  getIt.registerFactory<SettingsCubit>(() => SettingsCubit(getIt<AppData>()));
}

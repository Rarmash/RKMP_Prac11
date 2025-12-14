import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/app_data.dart';

class SettingsState extends Equatable {
  final bool isDark;
  const SettingsState(this.isDark);

  @override
  List<Object?> get props => [isDark];
}

class SettingsCubit extends Cubit<SettingsState> {
  final AppData data;
  SettingsCubit(this.data) : super(const SettingsState(false));

  void load() => emit(SettingsState(data.isDarkTheme));

  void toggleTheme() {
    data.isDarkTheme = !data.isDarkTheme;
    load();
  }
}

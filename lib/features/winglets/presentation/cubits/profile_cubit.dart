import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/app_data.dart';

class ProfileState extends Equatable {
  final String userName;
  const ProfileState(this.userName);

  @override
  List<Object?> get props => [userName];
}

class ProfileCubit extends Cubit<ProfileState> {
  final AppData data;
  ProfileCubit(this.data) : super(const ProfileState(''));

  void load() => emit(ProfileState(data.userName));

  void setName(String name) {
    data.userName = name.trim().isEmpty ? data.userName : name.trim();
    load();
  }
}

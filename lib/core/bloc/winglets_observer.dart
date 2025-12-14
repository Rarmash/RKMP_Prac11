import 'package:flutter_bloc/flutter_bloc.dart';

class WingletsObserver extends BlocObserver {
  const WingletsObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}
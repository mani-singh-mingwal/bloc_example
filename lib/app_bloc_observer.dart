import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint("$change");
    super.onChange(bloc, change);
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint("$bloc");
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint("$event");
    super.onEvent(bloc, event);
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint("$bloc");

    super.onClose(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint("$error");
    super.onError(bloc, error, stackTrace);
  }
}

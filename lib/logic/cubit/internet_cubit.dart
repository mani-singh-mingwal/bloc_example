import 'dart:async';

import 'package:block_example_two/constants.dart';
import 'package:block_example_two/logic/cubit/internet_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late final StreamSubscription connectivityStreamSubscription;

  InternetCubit(InternetState initialState, {required this.connectivity})
      : super(InternetLoading()) {
    connectivityStreamSubscription = monitorInternetConnection();
  }

  void emitInternetConnected(ConnectionType _connectionType) =>
      emit(InternetConnected(connectionType: _connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection() {
    return Connectivity().onConnectivityChanged.listen((connectionResult) {
      if (connectionResult == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.mobile);
      } else if (connectionResult == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.wifi);
      } else if (connectionResult == ConnectivityResult.none) {
        emitInternetDisconnected();
      }
    });
  }
}

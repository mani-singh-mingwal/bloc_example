import 'dart:async';

import 'package:block_example_two/constants.dart';
import 'package:block_example_two/logic/cubit/counter_state.dart';
import 'package:block_example_two/logic/cubit/internet_cubit.dart';
import 'package:block_example_two/logic/cubit/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late final StreamSubscription internetStreamSubscription;

  CounterCubit(CounterState initialState, {required this.internetCubit})
      : super(CounterState(counterValue: 0)) {
    internetStreamSubscription = _monitorInternetCubit();
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }

  StreamSubscription<InternetState> _monitorInternetCubit() {
    return internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.wifi) {
        increment();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.mobile) {
        decrement();
      }
    });
  }
}

import 'package:block_example_two/logic/cubit/counter_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit(CounterState initialState)
      : super(CounterState(counterValue: 0));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toJson();
  }
}

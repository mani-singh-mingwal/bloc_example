import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(initialState) : super(0) {
    on((event, emit) {
      if (event is CounterEvent && event == CounterEvent.increment) {
        emit(state + 1);
      } else if (event is CounterEvent && event == CounterEvent.decrement) {
        emit(state - 1);
      }
    });
  }
}

void main(List<String> args) async {
  final bloc = CounterBloc(0);
  debugPrint("${bloc.state}");

  final streamSubscription = bloc.stream.listen((data) {
    debugPrint("data $data");
  });

  bloc.add(CounterEvent.increment);
  debugPrint("${bloc.state}");

  bloc.add(CounterEvent.increment);
  debugPrint("${bloc.state}");

  bloc.add(CounterEvent.increment);
  debugPrint("${bloc.state}");

  bloc.add(CounterEvent.decrement);
  debugPrint("${bloc.state}");

  await Future.delayed(Duration.zero);
  await streamSubscription.cancel();
  await bloc.close();
}

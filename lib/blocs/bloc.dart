import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/blocs/event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<Increment>((event, emit) => emit(state + 1));
    on<Decrement>((event, emit) => emit(state - 1));
  }

  Stream<double> randomValue() async* {
    final random = Random();
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield random.nextDouble();
      yield random.nextDouble();
    }
  }
}

// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<TapCounterEvent>((event, emit) => emit(state + 1));
  }
}

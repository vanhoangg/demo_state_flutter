part of 'counter_bloc.dart';

abstract class CounterState {
  const CounterState(this.counter);

  final double counter;
}

part of 'count_bloc.dart';

abstract class CountEvent {
  const CountEvent();
}

class InitEvent extends CountEvent {}

class AddEvent extends CountEvent {}

class SubtractEvent extends CountEvent {}

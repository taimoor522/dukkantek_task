part of 'event_cubit.dart';

@immutable
abstract class EventState {}

class Eventloaded extends EventState {
  final List<Event> events;
  Eventloaded(this.events);
}

class EventLoading extends EventState {}

class EventError extends EventState {}

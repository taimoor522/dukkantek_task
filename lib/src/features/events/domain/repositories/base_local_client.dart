import '../entities/event.dart';

abstract class BaseLocalClient {
  Future<List<Event>> getFavoriteEvents();
  Future<bool> addEvent(Event event);
  Future<bool> removeEvent(Event event);
}

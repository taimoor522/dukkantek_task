import 'package:dukkantek_task_taimoor/src/features/events/domain/entities/event.dart';

abstract class EventRepository {
  Future<List<Event>> getEvents(String? query);

  Future<List<Event>> getFavoriteEvents();

  Future<bool> addEventToFavorite(Event event);

  Future<bool> removeEventFromFavorite(Event event);
}

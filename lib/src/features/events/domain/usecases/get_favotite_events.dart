import '../entities/event.dart';
import '../repositories/events_repository.dart';

class GetFavoriteEventsUseCase {
  final EventRepository repository;

  GetFavoriteEventsUseCase(this.repository);

  Future<List<Event>> call() async {
    return await repository.getFavoriteEvents();
  }
}

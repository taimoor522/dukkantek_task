import '../entities/event.dart';
import '../repositories/events_repository.dart';

class GetEventUseCase {
  final EventRepository repository;

  GetEventUseCase(this.repository);

  Future<List<Event>> call([String? query]) async {
    return await repository.getEvents(query);
  }
}

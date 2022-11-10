import '../entities/event.dart';
import '../repositories/events_repository.dart';

class RemoveFromFavoriteUseCase {
  final EventRepository repository;

  RemoveFromFavoriteUseCase(this.repository);

  Future<bool> call(Event event) async {
    return await repository.removeEventFromFavorite(event);
  }
}

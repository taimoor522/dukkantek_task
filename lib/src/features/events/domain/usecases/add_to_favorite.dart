import 'package:dukkantek_task_taimoor/src/features/events/domain/entities/event.dart';

import '../repositories/events_repository.dart';

class AddToFavoriteUseCase {
  final EventRepository repository;

  AddToFavoriteUseCase(
    this.repository,
  );

  Future<bool> call(Event event) async {
    return await repository.addEventToFavorite(event);
  }
}

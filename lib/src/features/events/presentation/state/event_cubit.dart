import 'package:bloc/bloc.dart';
import 'package:dukkantek_task_taimoor/src/features/events/domain/usecases/get_events.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/event.dart';
import '../../domain/usecases/add_to_favorite.dart';
import '../../domain/usecases/get_favotite_events.dart';
import '../../domain/usecases/remove_from_favorite.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  final GetEventUseCase getEventUseCase;
  final GetFavoriteEventsUseCase getFavoriteEventsUseCase;
  final AddToFavoriteUseCase addToFavoriteUseCase;
  final RemoveFromFavoriteUseCase removeFromFavoriteUseCase;

  List<Event> favoriteEvents = [];
  List<Event> lastFetchedEvents = [];

  EventCubit(
      {required this.getFavoriteEventsUseCase,
      required this.addToFavoriteUseCase,
      required this.removeFromFavoriteUseCase,
      required this.getEventUseCase})
      : super(EventLoading()) {
    loadFavoriteEvents();
  }
  void loadEvents() async {
    try {
      emit(EventLoading());
      lastFetchedEvents = await getEventUseCase();
      emit(Eventloaded(lastFetchedEvents));
    } catch (_) {
      emit(EventError());
    }
  }

  void addToFavorite(Event event) async {
    if (await addToFavoriteUseCase(event)) {
      favoriteEvents.add(event);
      emit(Eventloaded(List.from(lastFetchedEvents)));
    } else {
    }
  }

  void removeFromFavorite(Event event) async {
    if (await removeFromFavoriteUseCase(event)) {
      favoriteEvents.remove(event);
      emit(Eventloaded(List.castFrom(lastFetchedEvents)));
    }
  }

  void loadFavoriteEvents() async {
    favoriteEvents = await getFavoriteEventsUseCase();
  }

  void searchEvents(String query) async {
    final eventList = await getEventUseCase(query);
    emit(Eventloaded(eventList));
  }
}

import 'dart:convert';

import 'package:dukkantek_task_taimoor/src/features/events/domain/repositories/base_remote_client.dart';

import '../../domain/entities/event.dart';
import '../../domain/repositories/base_local_client.dart';
import '../../domain/repositories/events_repository.dart';
import '../models/events_model.dart';

class EventsRepositoryImpl implements EventRepository {
  final BaseRemoteClient remoteClient;
  final BaseLocalClient localClient;

  EventsRepositoryImpl({
    required this.remoteClient,
    required this.localClient,
  });

  @override
  Future<List<Event>> getEvents(String? query) async {
    final responce = await remoteClient.getRawEvents(query);
    final data = json.decode(responce);
    return data['events'].map<EventModel>((e) => EventModel.fromJson(e)).toList();
  }

  @override
  Future<List<Event>> getFavoriteEvents() async {
    return localClient.getFavoriteEvents();
  }

  @override
  Future<bool> addEventToFavorite(Event event) async {
    return await localClient.addEvent(event);
  }

  @override
  Future<bool> removeEventFromFavorite(Event event) async {
    return await localClient.removeEvent(event);
  }
}

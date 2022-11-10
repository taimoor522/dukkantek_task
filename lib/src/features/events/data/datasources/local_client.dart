import 'package:dukkantek_task_taimoor/src/features/events/domain/entities/event.dart';
import 'package:dukkantek_task_taimoor/src/features/events/domain/repositories/base_local_client.dart';
import 'package:hive/hive.dart';

class LocalClient extends BaseLocalClient {
  @override
  Future<List<Event>> getFavoriteEvents() async {
    final favoriteEventsBox = await Hive.openBox<Event>('favoriteEvents');
    try {
      final list = favoriteEventsBox.values.toList();
      return list;
    } catch (_) {
      return [];
    } finally {
      favoriteEventsBox.close();
    }
  }

  @override
  Future<bool> removeEvent(Event event) async {
    final favoriteEventsBox = await Hive.openBox<Event>('favoriteEvents');
    try {
      await favoriteEventsBox.delete(event.id);
      return true;
    } catch (_) {
      return false;
    } finally {
      favoriteEventsBox.close();
    }
  }

  @override
  Future<bool> addEvent(Event event) async {
    final favoriteEventsBox = await Hive.openBox<Event>('favoriteEvents');
    await favoriteEventsBox.put(event.id, event);
    favoriteEventsBox.close();
    return true;
    try {} catch (_) {
      return false;
    } finally {
      favoriteEventsBox.close();
    }
  }
}

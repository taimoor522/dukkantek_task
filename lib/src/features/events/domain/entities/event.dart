import 'package:dukkantek_task_taimoor/src/features/events/domain/entities/address.dart';
import 'package:dukkantek_task_taimoor/src/features/events/domain/entities/performer.dart';

class Event {
  int id;

  String title;

  String description;

  DateTime dateTime;

  Address address;

  String type;

  String ticketUrl;

  List<Performer> performer;
  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.address,
    required this.type,
    required this.ticketUrl,
    required this.performer,
  });
}

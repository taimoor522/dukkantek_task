import 'package:dukkantek_task_taimoor/src/features/events/data/models/address_model.dart';
import 'package:dukkantek_task_taimoor/src/features/events/data/models/performer_model.dart';
import 'package:dukkantek_task_taimoor/src/features/events/domain/entities/address.dart';
import 'package:dukkantek_task_taimoor/src/features/events/domain/entities/event.dart';
import 'package:dukkantek_task_taimoor/src/features/events/domain/entities/performer.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'events_model.g.dart';

@HiveType(typeId: 0)
class EventModel implements Event {
  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.address,
    required this.type,
    required this.ticketUrl,
    required this.performer,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    debugPrint('LOG : json : $json');
    return EventModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      dateTime: DateTime.parse(json['datetime_utc']),
      address: AddressModel.fromJson(json['venue']),
      type: json['type'],
      ticketUrl: json['venue']['url'],
      performer: List<Performer>.from(json['performers'].map((x) => PerformerModel.fromJson(x))),
    );
  }
  @override
  @HiveField(0)
  int id;

  @override
  @HiveField(1)
  String title;

  @override
  @HiveField(2)
  String description;

  @override
  @HiveField(3)
  DateTime dateTime;

  @override
  @HiveField(4)
  Address address;

  @override
  @HiveField(5)
  String type;

  @override
  @HiveField(6)
  String ticketUrl;

  @override
  @HiveField(7)
  List<Performer> performer;
}

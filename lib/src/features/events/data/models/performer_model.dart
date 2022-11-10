import 'package:dukkantek_task_taimoor/src/features/events/domain/entities/performer.dart';
import 'package:hive/hive.dart';

part 'performer_model.g.dart';

@HiveType(typeId: 2)
class PerformerModel implements Performer {
  PerformerModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory PerformerModel.fromJson(Map<String, dynamic> json) {
    return PerformerModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  @override
  @HiveField(0)
  int id;

  @override
  @HiveField(1)
  String image;

  @override
  @HiveField(2)
  String name;
}

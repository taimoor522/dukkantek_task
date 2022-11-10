import 'package:dukkantek_task_taimoor/src/features/events/domain/entities/latlng.dart';
import 'package:hive/hive.dart';

part 'latlng_model.g.dart';

@HiveType(typeId: 3)
class LatLngModel implements LatLng {
  LatLngModel({
    required this.latitude,
    required this.longitude,
  });

  @override
  @HiveField(0)
  final double latitude;

  @override
  @HiveField(1)
  final double longitude;

  factory LatLngModel.fromJson(double lat, double long) {
    return LatLngModel(
      latitude: lat,
      longitude: long,
    );
  }

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

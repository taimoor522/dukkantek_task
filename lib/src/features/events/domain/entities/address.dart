import 'package:dukkantek_task_taimoor/src/features/events/domain/entities/latlng.dart';

class Address {
  String addressLine;

  String city;

  String zip;

  String country;

  LatLng latLong;
  Address({
    required this.addressLine,
    required this.city,
    required this.zip,
    required this.country,
    required this.latLong,
  });
}

import 'package:dukkantek_task_taimoor/src/features/events/data/models/latlng_model.dart';
import 'package:dukkantek_task_taimoor/src/features/events/domain/entities/address.dart';
import 'package:dukkantek_task_taimoor/src/features/events/domain/entities/latlng.dart';
import 'package:hive/hive.dart';

part 'address_model.g.dart';

@HiveType(typeId: 1)
class AddressModel implements Address {
  AddressModel({
    required this.addressLine,
    required this.city,
    required this.country,
    required this.latLong,
    required this.zip,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      addressLine: json['address'] ?? '',
      city: json['city'] ?? '',
      zip: json['postal_code'] ?? '',
      country: json['country'] ?? '',
      latLong: LatLngModel.fromJson(
        json['location']['lat'],
        json['location']['lon'],
      ),
    );
  }

  @override
  @HiveField(0)
  String addressLine;

  @override
  @HiveField(1)
  String city;

  @override
  @HiveField(2)
  String country;

  @override
  @HiveField(3)
  LatLng latLong;

  @override
  @HiveField(4)
  String zip;
}

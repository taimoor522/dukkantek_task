// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latlng_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LatLngModelAdapter extends TypeAdapter<LatLngModel> {
  @override
  final int typeId = 3;

  @override
  LatLngModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LatLngModel(
      latitude: fields[0] as double,
      longitude: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, LatLngModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LatLngModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

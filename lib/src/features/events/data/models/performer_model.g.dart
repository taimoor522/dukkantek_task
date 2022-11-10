// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PerformerModelAdapter extends TypeAdapter<PerformerModel> {
  @override
  final int typeId = 2;

  @override
  PerformerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PerformerModel(
      id: fields[0] as int,
      name: fields[2] as String,
      image: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PerformerModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PerformerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

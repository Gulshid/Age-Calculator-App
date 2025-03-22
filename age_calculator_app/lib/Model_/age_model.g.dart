// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'age_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AgeModelAdapter extends TypeAdapter<AgeModel> {
  @override
  final int typeId = 0;

  @override
  AgeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AgeModel(
      date_of_Birth: fields[0] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, AgeModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.date_of_Birth);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AgeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

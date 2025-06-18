// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServicesModelAdapter extends TypeAdapter<ServicesModel> {
  @override
  final int typeId = 3;

  @override
  ServicesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ServicesModel(
      name: fields[0] as String,
      more: fields[1] as String,
      id: fields[2] as String,
      imgUrl: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ServicesModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.more)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.imgUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServicesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

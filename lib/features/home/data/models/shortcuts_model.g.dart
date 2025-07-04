// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shortcuts_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShortcutsModelAdapter extends TypeAdapter<ShortcutsModel> {
  @override
  final int typeId = 4;

  @override
  ShortcutsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShortcutsModel(
      id: fields[0] as String,
      name: fields[1] as String,
      imgUrl: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ShortcutsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imgUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShortcutsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

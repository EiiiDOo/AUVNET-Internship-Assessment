// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_code_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiscountCodeModelAdapter extends TypeAdapter<DiscountCodeModel> {
  @override
  final int typeId = 1;

  @override
  DiscountCodeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DiscountCodeModel(
      title: fields[0] as String,
      desc: fields[1] as String,
      id: fields[2] as String,
      imgUrl: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DiscountCodeModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.desc)
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
      other is DiscountCodeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

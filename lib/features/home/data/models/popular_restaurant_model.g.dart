// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_restaurant_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PopularRestaurantNearbyModelAdapter
    extends TypeAdapter<PopularRestaurantNearbyModel> {
  @override
  final int typeId = 2;

  @override
  PopularRestaurantNearbyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PopularRestaurantNearbyModel(
      name: fields[0] as String,
      time: fields[1] as String,
      id: fields[2] as String,
      imgUrl: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PopularRestaurantNearbyModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.time)
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
      other is PopularRestaurantNearbyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

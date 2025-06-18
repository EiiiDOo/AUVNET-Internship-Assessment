import 'package:auvnet_internship_assessment/core/constants/remote_storage_key.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/popular_restaurant_nearby_entity.dart';
import 'package:hive/hive.dart';

part 'popular_restaurant_model.g.dart';

@HiveType(typeId: 2)
class PopularRestaurantNearbyModel extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String time;
  @HiveField(2)
  final String id;
  @HiveField(3)
  final String imgUrl;

  PopularRestaurantNearbyModel({
    required this.name,
    required this.time,
    required this.id,
    required this.imgUrl,
  });

  factory PopularRestaurantNearbyModel.fromJson(Map<String, dynamic> json) {
    return PopularRestaurantNearbyModel(
      name: json['name'] ?? 'no name',
      time: json['time'] ?? 'no time',
      id: json['id'].toString(),
      imgUrl: json[RemoteStorageKey.IMAGE_URL] ?? 'no imgurl',
    );
  }

  PopularRestaurantNearbyEntity toEntity() {
    return PopularRestaurantNearbyEntity(
      name: name,
      time: time,
      id: id,
      imgUrl: imgUrl,
    );
  }
}

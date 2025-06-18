import 'package:auvnet_internship_assessment/core/constants/remote_storage_key.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/advertising_entity.dart';
import 'package:hive/hive.dart';

part 'advertising_model.g.dart';

@HiveType(typeId: 0)
class AdvertisingModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String imgUrl;

  AdvertisingModel({
    required this.id,
    required this.name,
    required this.imgUrl,
  });

  factory AdvertisingModel.fromJson(Map<String, dynamic> json) {
    return AdvertisingModel(
      id: json['id'].toString(),
      name: json['name'] ?? 'no title',
      imgUrl: json[RemoteStorageKey.IMAGE_URL] ?? '',
    );
  }

  AdvertisingEntity toEntity() {
    return AdvertisingEntity(id: id, name: name, imgUrl: imgUrl);
  }
}

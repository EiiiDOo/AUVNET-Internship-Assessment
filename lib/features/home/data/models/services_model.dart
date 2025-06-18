import 'package:auvnet_internship_assessment/core/constants/remote_storage_key.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/services_entity.dart';
import 'package:hive/hive.dart';

part 'services_model.g.dart';

@HiveType(typeId: 3)
class ServicesModel extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String more;
  @HiveField(2)
  final String id;
  @HiveField(3)
  final String imgUrl;

  ServicesModel({
    required this.name,
    required this.more,
    required this.id,
    required this.imgUrl,
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
      name: json['name'] ?? 'no name',
      more: json['more'] ?? 'no more',
      id: json['id'].toString(),
      imgUrl: json[RemoteStorageKey.IMAGE_URL] ?? 'no image url',
    );
  }

  ServicesEntity toEntity() {
    return ServicesEntity(name: name, more: more, id: id, imgUrl: imgUrl);
  }
}

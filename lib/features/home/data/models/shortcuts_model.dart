import 'package:auvnet_internship_assessment/core/constants/remote_storage_key.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/shortcuts_entity.dart';
import 'package:hive/hive.dart';

part 'shortcuts_model.g.dart';

@HiveType(typeId: 4)
class ShortcutsModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String imgUrl;

  ShortcutsModel({required this.id, required this.name, required this.imgUrl});

  factory ShortcutsModel.fromJson(Map<String, dynamic> json) {
    return ShortcutsModel(
      id: json['id'].toString(),
      name: json['name'] ?? 'no name',
      imgUrl: json[RemoteStorageKey.IMAGE_URL] ?? 'no img url',
    );
  }

  ShortcutsEntity toEntity() {
    return ShortcutsEntity(id: id, name: name, imgUrl: imgUrl);
  }
}

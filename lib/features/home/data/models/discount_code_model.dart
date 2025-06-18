import 'package:auvnet_internship_assessment/core/constants/remote_storage_key.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/discount_code_entity.dart';
import 'package:hive/hive.dart';

part 'discount_code_model.g.dart';

@HiveType(typeId: 1)
class DiscountCodeModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String desc;
  @HiveField(2)
  final String id;
  @HiveField(3)
  final String imgUrl;

  DiscountCodeModel({
    required this.title,
    required this.desc,
    required this.id,
    required this.imgUrl,
  });

  factory DiscountCodeModel.fromJson(Map<String, dynamic> json) {
    return DiscountCodeModel(
      title: json['title'] ?? 'no title',
      desc: json['desc'] ?? 'no desc',
      id: json['id'].toString(),
      imgUrl: json[RemoteStorageKey.IMAGE_URL] ?? 'no img url',
    );
  }
  DiscountCodeEntity toEntity() {
    return DiscountCodeEntity(title: title, desc: desc, id: id, imgUrl: imgUrl);
  }
}

import 'package:auvnet_internship_assessment/features/home/domain/entities/advertising_entity.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/discount_code_entity.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/popular_restaurant_nearby_entity.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/services_entity.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/shortcuts_entity.dart';

abstract class HomeRepository {
  Future<List<AdvertisingEntity>> getAdvertisingList();

  Future<List<DiscountCodeEntity>> getDiscountCodesList();

  Future<List<ShortcutsEntity>> getShortcutsList();

  Future<List<PopularRestaurantNearbyEntity>> getPopularRestaurantNearbyList();

  Future<List<ServicesEntity>> getServicesList();
}

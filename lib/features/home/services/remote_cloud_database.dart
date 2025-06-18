import 'package:auvnet_internship_assessment/features/home/data/models/advertising_model.dart';
import 'package:auvnet_internship_assessment/features/home/data/models/discount_code_model.dart';
import 'package:auvnet_internship_assessment/features/home/data/models/popular_restaurant_model.dart';
import 'package:auvnet_internship_assessment/features/home/data/models/services_model.dart';
import 'package:auvnet_internship_assessment/features/home/data/models/shortcuts_model.dart';

abstract class RemoteCloudDatabase {
  Future<List<AdvertisingModel>> getAdvertisingList();

  Future<List<DiscountCodeModel>> getDiscountCodesList();

  Future<List<ShortcutsModel>> getShortcutsList();

  Future<List<PopularRestaurantNearbyModel>> getPopularRestaurantNearbyList();

  Future<List<ServicesModel>> getServicesList();
}

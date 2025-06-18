import 'package:auvnet_internship_assessment/features/home/data/models/advertising_model.dart';
import 'package:auvnet_internship_assessment/features/home/data/models/discount_code_model.dart';
import 'package:auvnet_internship_assessment/features/home/data/models/popular_restaurant_model.dart';
import 'package:auvnet_internship_assessment/features/home/data/models/services_model.dart';
import 'package:auvnet_internship_assessment/features/home/data/models/shortcuts_model.dart';
import 'package:auvnet_internship_assessment/features/home/services/remote_cloud_database.dart';

abstract class HomeRemoteDataSource {
  Future<List<AdvertisingModel>> getAdvertisingList();

  Future<List<DiscountCodeModel>> getDiscountCodesList();

  Future<List<ShortcutsModel>> getShortcutsList();

  Future<List<PopularRestaurantNearbyModel>> getPopularRestaurantNearbyList();

  Future<List<ServicesModel>> getServicesList();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final RemoteCloudDatabase remoteCloudDatabase;

  HomeRemoteDataSourceImpl({required this.remoteCloudDatabase});

  @override
  Future<List<AdvertisingModel>> getAdvertisingList() {
    return remoteCloudDatabase.getAdvertisingList();
  }

  @override
  Future<List<DiscountCodeModel>> getDiscountCodesList() {
    return remoteCloudDatabase.getDiscountCodesList();
  }

  @override
  Future<List<PopularRestaurantNearbyModel>> getPopularRestaurantNearbyList() {
    return remoteCloudDatabase.getPopularRestaurantNearbyList();
  }

  @override
  Future<List<ServicesModel>> getServicesList() {
    return remoteCloudDatabase.getServicesList();
  }

  @override
  Future<List<ShortcutsModel>> getShortcutsList() {
    return remoteCloudDatabase.getShortcutsList();
  }
}

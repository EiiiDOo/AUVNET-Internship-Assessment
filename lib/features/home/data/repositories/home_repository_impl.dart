import 'package:auvnet_internship_assessment/core/error/exceptions.dart';
import 'package:auvnet_internship_assessment/core/network/network._info.dart';
import 'package:auvnet_internship_assessment/core/storage/local_storage.dart';
import 'package:auvnet_internship_assessment/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/advertising_entity.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/discount_code_entity.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/popular_restaurant_nearby_entity.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/services_entity.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/shortcuts_entity.dart';
import 'package:auvnet_internship_assessment/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final NetworkInfo networkInfo;
  final LocalStorage localStorage;

  HomeRepositoryImpl({
    required this.homeRemoteDataSource,
    required this.networkInfo,
    required this.localStorage,
  });

  @override
  Future<List<AdvertisingEntity>> getAdvertisingList() async {
    if (await networkInfo.isConnected()) {
      try {
        final models = await homeRemoteDataSource.getAdvertisingList();
        // await localStorage.put(LocalStorageKeys.advertising.name, models);
        final entities = models.map((e) {
          return e.toEntity();
        }).toList();
        return entities;
      } catch (e) {
        rethrow;
      }
    }
    throw NetworkFailure('No internet connection');
  }

  @override
  Future<List<DiscountCodeEntity>> getDiscountCodesList() async {
    if (await networkInfo.isConnected()) {
      final models = await homeRemoteDataSource.getDiscountCodesList();
      // await localStorage.put(LocalStorageKeys.discountCodes.name, models);
      final entities = models.map((e) {
        return e.toEntity();
      }).toList();
      return entities;
    }
    throw NetworkFailure('No internet connection');
  }

  @override
  Future<List<PopularRestaurantNearbyEntity>>
  getPopularRestaurantNearbyList() async {
    if (await networkInfo.isConnected()) {
      final models = await homeRemoteDataSource
          .getPopularRestaurantNearbyList();
      // await localStorage.put(
      //   LocalStorageKeys.popularRestaurantNearby.name,
      //   models,
      // );
      final entities = models.map((e) {
        return e.toEntity();
      }).toList();
      return entities;
    }
    throw NetworkFailure('No internet connection');
  }

  @override
  Future<List<ServicesEntity>> getServicesList() async {
    if (await networkInfo.isConnected()) {
      final models = await homeRemoteDataSource.getServicesList();
      // await localStorage.put(LocalStorageKeys.services.name, models);
      final entities = models.map((e) {
        return e.toEntity();
      }).toList();
      return entities;
    }
    throw NetworkFailure('No internet connection');
  }

  @override
  Future<List<ShortcutsEntity>> getShortcutsList() async {
    if (await networkInfo.isConnected()) {
      final models = await homeRemoteDataSource.getShortcutsList();
      // await localStorage.put(LocalStorageKeys.shortcuts.name, models);
      final entities = models.map((e) {
        return e.toEntity();
      }).toList();
      return entities;
    }
    throw NetworkFailure('No internet connection');
  }
}

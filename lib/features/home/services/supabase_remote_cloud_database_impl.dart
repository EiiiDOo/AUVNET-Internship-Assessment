import 'dart:io';
import 'package:auvnet_internship_assessment/core/constants/remote_storage_key.dart';
import 'package:auvnet_internship_assessment/core/error/exceptions.dart';
import 'package:auvnet_internship_assessment/features/home/data/models/advertising_model.dart';
import 'package:auvnet_internship_assessment/features/home/data/models/discount_code_model.dart';
import 'package:auvnet_internship_assessment/features/home/data/models/popular_restaurant_model.dart';
import 'package:auvnet_internship_assessment/features/home/data/models/services_model.dart';
import 'package:auvnet_internship_assessment/features/home/data/models/shortcuts_model.dart';
import 'package:auvnet_internship_assessment/features/home/services/remote_cloud_database.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseRemoteCloudDatabaseImpl extends RemoteCloudDatabase {
  final SupabaseClient supabase;

  SupabaseRemoteCloudDatabaseImpl({required this.supabase});

  @override
  Future<List<AdvertisingModel>> getAdvertisingList() async {
    try {
      final response = await supabase
          .from(RemoteStorageKey.ADVERTISING_TABLE_NAME)
          .select();
      return response.map((e) => AdvertisingModel.fromJson(e)).toList();
    } on PostgrestException catch (e) {
      throw DataFailure("Database error: ${e.message}");
    } on SocketException catch (e) {
      throw NetworkFailure("Network error: ${e.message}");
    } catch (e, stack) {
      throw UnknownFailure();
    }
  }

  @override
  Future<List<DiscountCodeModel>> getDiscountCodesList() async {
    try {
      final response = await supabase
          .from(RemoteStorageKey.DISCOUNT_CODES_TABLE_NAME)
          .select();
      return response.map((e) => DiscountCodeModel.fromJson(e)).toList();
    } on PostgrestException catch (e) {
      throw DataFailure("Database error: ${e.message}");
    } on SocketException catch (e) {
      throw NetworkFailure("Network error: ${e.message}");
    } catch (e) {
      throw UnknownFailure();
    }
  }

  @override
  Future<List<ShortcutsModel>> getShortcutsList() async {
    try {
      final response = await supabase
          .from(RemoteStorageKey.SHORTCUTS_TABLE_NAME)
          .select();
      return response.map((e) => ShortcutsModel.fromJson(e)).toList();
    } on PostgrestException catch (e) {
      throw DataFailure("Database error: ${e.message}");
    } on SocketException catch (e) {
      throw NetworkFailure("Network error: ${e.message}");
    } catch (e) {
      throw UnknownFailure();
    }
  }

  @override
  Future<List<PopularRestaurantNearbyModel>>
  getPopularRestaurantNearbyList() async {
    try {
      final response = await supabase
          .from(RemoteStorageKey.POPULAR_RESTAURANT_NEARBY_TABLE_NAME)
          .select();
      return response
          .map((e) => PopularRestaurantNearbyModel.fromJson(e))
          .toList();
    } on PostgrestException catch (e) {
      throw DataFailure("Database error: ${e.message}");
    } on SocketException catch (e) {
      throw NetworkFailure("Network error: ${e.message}");
    } catch (e) {
      throw UnknownFailure();
    }
  }

  @override
  Future<List<ServicesModel>> getServicesList() async {
    try {
      final response = await supabase
          .from(RemoteStorageKey.SERVICES_TABLE_NAME)
          .select();
      return response.map((e) => ServicesModel.fromJson(e)).toList();
    } on PostgrestException catch (e) {
      throw DataFailure("Database error: ${e.message}");
    } on SocketException catch (e) {
      throw NetworkFailure("Network error: ${e.message}");
    } catch (e) {
      throw UnknownFailure();
    }
  }
}

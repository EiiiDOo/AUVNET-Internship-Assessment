import 'package:auvnet_internship_assessment/core/constants/storage_keys.dart';

abstract class LocalStorage {
  dynamic get(String key);
  Future<void> delete(StorageKeys key);
  Future<void> put(String key, dynamic value);
}

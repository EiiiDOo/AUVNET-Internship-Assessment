import 'package:auvnet_internship_assessment/core/constants/local_storage_keys.dart';

abstract class LocalStorage {
  dynamic get(String key);
  Future<void> delete(LocalStorageKeys key);
  Future<void> put(String key, dynamic value);
  Future<void> putAll(Map<String, dynamic> values);
}

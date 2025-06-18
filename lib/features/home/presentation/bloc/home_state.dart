import 'package:equatable/equatable.dart';
import '../../domain/entities/advertising_entity.dart';
import '../../domain/entities/discount_code_entity.dart';
import '../../domain/entities/shortcuts_entity.dart';
import '../../domain/entities/popular_restaurant_nearby_entity.dart';
import '../../domain/entities/services_entity.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<AdvertisingEntity> advertising;
  final List<DiscountCodeEntity> discountCodes;
  final List<ShortcutsEntity> shortcuts;
  final List<PopularRestaurantNearbyEntity> nearbyRestaurants;
  final List<ServicesEntity> services;

  HomeLoaded({
    required this.advertising,
    required this.discountCodes,
    required this.shortcuts,
    required this.nearbyRestaurants,
    required this.services,
  });

  @override
  List<Object?> get props => [
    advertising,
    discountCodes,
    shortcuts,
    nearbyRestaurants,
    services,
  ];
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);

  @override
  List<Object?> get props => [message];
}

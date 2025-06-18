import 'package:auvnet_internship_assessment/core/error/error_parse.dart';
import 'package:auvnet_internship_assessment/features/home/domain/use_cases/get_advertising_list_usecase.dart';
import 'package:auvnet_internship_assessment/features/home/domain/use_cases/get_discount_codes_list_usecase.dart';
import 'package:auvnet_internship_assessment/features/home/domain/use_cases/get_popular_restaurant_nearby_list_usecase.dart';
import 'package:auvnet_internship_assessment/features/home/domain/use_cases/get_services_list_usecase.dart';
import 'package:auvnet_internship_assessment/features/home/domain/use_cases/get_shortcuts_list_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAdvertisingListUseCase getAdvertisingList;
  final GetDiscountCodesListUseCase getDiscountCodesList;
  final GetShortcutsListUseCase getShortcutsList;
  final GetPopularRestaurantNearbyListUseCase getNearbyRestaurants;
  final GetServicesListUseCase getServicesList;

  HomeBloc({
    required this.getAdvertisingList,
    required this.getDiscountCodesList,
    required this.getShortcutsList,
    required this.getNearbyRestaurants,
    required this.getServicesList,
  }) : super(HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
  }

  Future<void> _onLoadHomeData(
    LoadHomeData event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    try {
      final advertising = await getAdvertisingList();
      final discountCodes = await getDiscountCodesList();
      final shortcuts = await getShortcutsList();
      final nearby = await getNearbyRestaurants();
      final services = await getServicesList();

      emit(
        HomeLoaded(
          advertising: advertising,
          discountCodes: discountCodes,
          shortcuts: shortcuts,
          nearbyRestaurants: nearby,
          services: services,
        ),
      );
    } catch (e) {
      emit(HomeError(e.errorMessage));
    }
  }
}

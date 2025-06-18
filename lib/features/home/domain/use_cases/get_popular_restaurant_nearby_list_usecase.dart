import '../entities/popular_restaurant_nearby_entity.dart';
import '../repositories/home_repository.dart';

class GetPopularRestaurantNearbyListUseCase {
  final HomeRepository repository;

  GetPopularRestaurantNearbyListUseCase(this.repository);

  Future<List<PopularRestaurantNearbyEntity>> call() {
    return repository.getPopularRestaurantNearbyList();
  }
}

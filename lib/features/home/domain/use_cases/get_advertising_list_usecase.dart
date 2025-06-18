import '../entities/advertising_entity.dart';
import '../repositories/home_repository.dart';

class GetAdvertisingListUseCase {
  final HomeRepository repository;

  GetAdvertisingListUseCase(this.repository);

  Future<List<AdvertisingEntity>> call() {
    print('UseCase: called GetAdvertisingListUseCase');

    return repository.getAdvertisingList();
  }
}

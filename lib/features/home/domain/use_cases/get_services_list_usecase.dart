import '../entities/services_entity.dart';
import '../repositories/home_repository.dart';

class GetServicesListUseCase {
  final HomeRepository repository;

  GetServicesListUseCase(this.repository);

  Future<List<ServicesEntity>> call() {
    return repository.getServicesList();
  }
}

import '../entities/discount_code_entity.dart';
import '../repositories/home_repository.dart';

class GetDiscountCodesListUseCase {
  final HomeRepository repository;

  GetDiscountCodesListUseCase(this.repository);

  Future<List<DiscountCodeEntity>> call() {
    return repository.getDiscountCodesList();
  }
}

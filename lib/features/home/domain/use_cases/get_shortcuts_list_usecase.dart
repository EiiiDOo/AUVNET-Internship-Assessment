import '../entities/shortcuts_entity.dart';
import '../repositories/home_repository.dart';

class GetShortcutsListUseCase {
  final HomeRepository repository;

  GetShortcutsListUseCase(this.repository);

  Future<List<ShortcutsEntity>> call() {
    return repository.getShortcutsList();
  }
}

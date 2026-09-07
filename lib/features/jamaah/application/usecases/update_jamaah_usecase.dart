import '../../domain/entities/jamaah_entity.dart';
import '../../domain/repository/jamaah_repository.dart';

class UpdateJamaahUseCase {
  final JamaahRepository repository;

  const UpdateJamaahUseCase({required this.repository});

  Future<JamaahEntity> call(JamaahEntity jamaah) {
    return repository.update(jamaah);
  }
}

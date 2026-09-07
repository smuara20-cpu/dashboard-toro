import '../../domain/entities/jamaah_entity.dart';
import '../../domain/repository/jamaah_repository.dart';

class CreateJamaahUseCase {
  final JamaahRepository repository;

  const CreateJamaahUseCase({required this.repository});

  Future<JamaahEntity> call(JamaahEntity jamaah) {
    return repository.create(jamaah);
  }
}

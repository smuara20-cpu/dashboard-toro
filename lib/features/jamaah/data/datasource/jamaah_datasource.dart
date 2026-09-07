import '../models/jamaah_model.dart';

abstract interface class JamaahDataSource {
  Future<JamaahModel> create(JamaahModel jamaah);

  Future<JamaahModel?> getById({required String id, required String tenantId});

  Future<List<JamaahModel>> getAll({required String tenantId});

  Future<List<JamaahModel>> getByCustomerReference({
    required String customerId,
    required String tenantId,
  });

  Future<JamaahModel> update(JamaahModel jamaah);
}

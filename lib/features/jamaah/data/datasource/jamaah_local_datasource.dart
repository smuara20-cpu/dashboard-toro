import '../models/jamaah_model.dart';
import 'jamaah_datasource.dart';

class JamaahLocalDataSource implements JamaahDataSource {
  final List<JamaahModel> _items;

  JamaahLocalDataSource({List<JamaahModel>? initialItems})
    : _items = List<JamaahModel>.from(initialItems ?? const []);

  @override
  Future<JamaahModel> create(JamaahModel jamaah) async {
    final exists = _items.any((item) => item.id == jamaah.id);

    if (exists) {
      throw StateError('Jamaah dengan id ${jamaah.id} sudah ada.');
    }

    _items.add(jamaah);
    return jamaah;
  }

  @override
  Future<JamaahModel?> getById({
    required String id,
    required String tenantId,
  }) async {
    for (final item in _items) {
      if (item.id == id &&
          item.tenantId == tenantId &&
          item.deletedAt == null) {
        return item;
      }
    }

    return null;
  }

  @override
  Future<List<JamaahModel>> getAll({required String tenantId}) async {
    return List<JamaahModel>.unmodifiable(
      _items.where(
        (item) => item.tenantId == tenantId && item.deletedAt == null,
      ),
    );
  }

  @override
  Future<List<JamaahModel>> getByCustomerReference({
    required String customerId,
    required String tenantId,
  }) async {
    return List<JamaahModel>.unmodifiable(
      _items.where(
        (item) =>
            item.customerId == customerId &&
            item.tenantId == tenantId &&
            item.deletedAt == null,
      ),
    );
  }

  @override
  Future<JamaahModel> update(JamaahModel jamaah) async {
    for (var index = 0; index < _items.length; index++) {
      final item = _items[index];

      if (item.id == jamaah.id && item.tenantId == jamaah.tenantId) {
        _items[index] = jamaah;
        return jamaah;
      }
    }

    throw StateError('Jamaah dengan id ${jamaah.id} tidak ditemukan.');
  }
}

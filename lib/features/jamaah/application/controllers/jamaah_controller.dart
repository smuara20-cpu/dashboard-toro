import '../../domain/entities/jamaah_entity.dart';
import '../../domain/value_objects/jamaah_customer_reference.dart';
import '../../domain/value_objects/jamaah_id.dart';
import '../../domain/value_objects/jamaah_tenant_context.dart';
import '../state/jamaah_state.dart';
import '../usecases/create_jamaah_usecase.dart';
import '../usecases/get_jamaah_by_customer_reference_usecase.dart';
import '../usecases/get_jamaah_by_id_usecase.dart';
import '../usecases/get_jamaahs_usecase.dart';
import '../usecases/update_jamaah_usecase.dart';

class JamaahController {
  final CreateJamaahUseCase createJamaahUseCase;
  final GetJamaahByIdUseCase getJamaahByIdUseCase;
  final GetJamaahsUseCase getJamaahsUseCase;
  final GetJamaahByCustomerReferenceUseCase getJamaahByCustomerReferenceUseCase;
  final UpdateJamaahUseCase updateJamaahUseCase;

  JamaahState _state = const JamaahState();

  JamaahState get state => _state;

  JamaahController({
    required this.createJamaahUseCase,
    required this.getJamaahByIdUseCase,
    required this.getJamaahsUseCase,
    required this.getJamaahByCustomerReferenceUseCase,
    required this.updateJamaahUseCase,
  });

  Future<bool> initialize({required JamaahTenantContext tenantContext}) {
    return loadJamaahs(tenantContext: tenantContext);
  }

  Future<bool> refresh({required JamaahTenantContext tenantContext}) {
    return loadJamaahs(tenantContext: tenantContext);
  }

  Future<bool> loadJamaahs({required JamaahTenantContext tenantContext}) async {
    _state = _state.copyWith(
      status: JamaahStateStatus.loading,
      clearErrorMessage: true,
    );

    try {
      final jamaahs = await getJamaahsUseCase(tenantContext: tenantContext);

      _state = _state.copyWith(
        status: jamaahs.isEmpty
            ? JamaahStateStatus.empty
            : JamaahStateStatus.success,
        jamaahs: List<JamaahEntity>.unmodifiable(jamaahs),
        clearErrorMessage: true,
      );

      return true;
    } catch (error) {
      _state = _state.copyWith(
        status: JamaahStateStatus.failure,
        errorMessage: error.toString(),
      );

      return false;
    }
  }

  Future<void> loadById({
    required JamaahId id,
    required JamaahTenantContext tenantContext,
  }) async {
    try {
      final jamaah = await getJamaahByIdUseCase(
        id: id,
        tenantContext: tenantContext,
      );

      _state = _state.copyWith(
        selectedJamaah: jamaah,
        clearSelectedJamaah: jamaah == null,
        clearErrorMessage: true,
      );
    } catch (error) {
      _state = _state.copyWith(
        status: JamaahStateStatus.failure,
        errorMessage: error.toString(),
      );
    }
  }

  Future<void> loadByCustomerReference({
    required JamaahCustomerReference customerReference,
    required JamaahTenantContext tenantContext,
  }) async {
    try {
      final jamaahs = await getJamaahByCustomerReferenceUseCase(
        customerReference: customerReference,
        tenantContext: tenantContext,
      );

      _state = _state.copyWith(
        status: jamaahs.isEmpty
            ? JamaahStateStatus.empty
            : JamaahStateStatus.success,
        jamaahs: List<JamaahEntity>.unmodifiable(jamaahs),
        clearErrorMessage: true,
      );
    } catch (error) {
      _state = _state.copyWith(
        status: JamaahStateStatus.failure,
        errorMessage: error.toString(),
      );
    }
  }

  Future<bool> create(JamaahEntity jamaah) async {
    try {
      await createJamaahUseCase(jamaah);

      final refreshed = await loadJamaahs(tenantContext: jamaah.tenantContext);

      return refreshed;
    } catch (error) {
      _state = _state.copyWith(
        status: JamaahStateStatus.failure,
        errorMessage: error.toString(),
      );

      return false;
    }
  }

  Future<bool> update(JamaahEntity jamaah) async {
    try {
      final updated = await updateJamaahUseCase(jamaah);

      _state = _state.copyWith(
        selectedJamaah: updated,
        clearErrorMessage: true,
      );

      final refreshed = await loadJamaahs(tenantContext: jamaah.tenantContext);

      if (!refreshed) {
        return false;
      }

      _state = _state.copyWith(selectedJamaah: updated);

      return true;
    } catch (error) {
      _state = _state.copyWith(
        status: JamaahStateStatus.failure,
        errorMessage: error.toString(),
      );

      return false;
    }
  }

  void selectJamaah(JamaahEntity jamaah) {
    _state = _state.copyWith(selectedJamaah: jamaah, clearErrorMessage: true);
  }

  void clearSelection() {
    _state = _state.copyWith(clearSelectedJamaah: true);
  }
}

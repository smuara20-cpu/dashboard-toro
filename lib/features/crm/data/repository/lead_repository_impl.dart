import '../../domain/entities/lead.dart';
import '../../domain/repository/lead_repository.dart';
import '../datasource/lead_datasource.dart';
import '../mapper/lead_mapper.dart';

class LeadRepositoryImpl implements LeadRepository {
  final LeadDataSource dataSource;
  final LeadMapper mapper;

  const LeadRepositoryImpl({
    required this.dataSource,
    required this.mapper,
  });

  @override
  Future<Lead> createLead(Lead lead) async {
    if (lead.isDeleted) {
      throw ArgumentError.value(
        lead.id,
        'lead',
        'Cannot create an already deleted lead.',
      );
    }

    final created = await dataSource.createLead(
      mapper.toModel(lead),
    );

    _ensureSameScope(
      expectedTenantId: lead.tenantId,
      expectedCompanyId: lead.companyId,
      actualTenantId: created.tenantId,
      actualCompanyId: created.companyId,
    );

    return mapper.toEntity(created);
  }

  @override
  Future<Lead?> getLeadById({
    required String id,
    required String tenantId,
    required String companyId,
  }) async {
    final model = await dataSource.getLeadById(
      id: id,
      tenantId: tenantId,
      companyId: companyId,
    );

    if (model == null) {
      return null;
    }

    _ensureSameScope(
      expectedTenantId: tenantId,
      expectedCompanyId: companyId,
      actualTenantId: model.tenantId,
      actualCompanyId: model.companyId,
    );

    return mapper.toEntity(model);
  }

  @override
  Future<List<Lead>> getLeads({
    required String tenantId,
    required String companyId,
  }) async {
    final models = await dataSource.getLeads(
      tenantId: tenantId,
      companyId: companyId,
    );

    for (final model in models) {
      _ensureSameScope(
        expectedTenantId: tenantId,
        expectedCompanyId: companyId,
        actualTenantId: model.tenantId,
        actualCompanyId: model.companyId,
      );
    }

    return models
        .map(mapper.toEntity)
        .where((lead) => !lead.isDeleted)
        .toList(growable: false);
  }

  @override
  Future<Lead> updateLead(Lead lead) async {
    final updated = await dataSource.updateLead(
      mapper.toModel(lead),
    );

    _ensureSameScope(
      expectedTenantId: lead.tenantId,
      expectedCompanyId: lead.companyId,
      actualTenantId: updated.tenantId,
      actualCompanyId: updated.companyId,
    );

    return mapper.toEntity(updated);
  }

  void _ensureSameScope({
    required String expectedTenantId,
    required String expectedCompanyId,
    required String actualTenantId,
    required String actualCompanyId,
  }) {
    if (expectedTenantId != actualTenantId ||
        expectedCompanyId != actualCompanyId) {
      throw StateError(
        'Lead data source returned data outside the requested scope.',
      );
    }
  }
}

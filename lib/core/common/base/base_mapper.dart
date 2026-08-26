/// Base contract for converting between
/// data models and domain entities.
///
/// [E] = Domain Entity
/// [M] = Data Model / DTO
abstract interface class BaseMapper<E, M> {
  /// Converts a data model into a domain entity.
  E toEntity(M model);

  /// Converts a domain entity into a data model.
  M toModel(E entity);
}
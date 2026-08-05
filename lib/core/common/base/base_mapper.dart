abstract class BaseMapper<E, M> {
  const BaseMapper();

  E toEntity(M model);

  M toModel(E entity);
}
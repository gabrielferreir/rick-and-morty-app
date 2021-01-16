abstract class MapperDomain<T, F> {
  T handle(F f);

  T fromModel(F f) => handle(f ?? {});

  List<T> fromModelList(List<F> map) =>
      map?.map((i) => fromModel(i))?.toList() ?? [];
}

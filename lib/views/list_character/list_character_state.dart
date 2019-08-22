import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/model/character_model.dart';

@immutable
abstract class ListCharacterState extends Equatable {
  ListCharacterState([List props = const []]) : super(props);
}

class Loading extends ListCharacterState {}

class Loaded extends ListCharacterState {
  final List<Character> list;
  final bool finish;
  final bool loading;
  final int page;

  Loaded(
      {@required this.list,
      @required this.finish,
      @required this.loading,
      @required this.page})
      : super([list, finish, loading, page]);

  Loaded copyWith({List<Character> list, bool finish, bool loading, int page}) {
    return Loaded(
        loading: loading == null ? this.loading : loading,
        finish: finish == null ? this.finish : finish,
        page: page ?? this.page,
        list: list ?? this.list);
  }
}

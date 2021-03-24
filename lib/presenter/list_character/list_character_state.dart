import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/domain/entities/character.dart';

@immutable
abstract class ListCharacterState {}

class Loading extends ListCharacterState {}

class Loaded extends Equatable implements ListCharacterState {
  final List<Character> list;
  final bool finish;
  final bool loading;
  final int page;

  Loaded(
      {@required this.list,
      @required this.finish,
      @required this.loading,
      @required this.page});

  @override
  List get props => [list, finish, loading, page];

  Loaded copyWith({List<Character> list, bool finish, bool loading, int page}) {
    return Loaded(
        loading: loading == null ? this.loading : loading,
        finish: finish == null ? this.finish : finish,
        page: page ?? this.page,
        list: list ?? this.list);
  }
}

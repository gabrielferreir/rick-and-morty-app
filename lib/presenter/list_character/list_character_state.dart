import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../domain/entities/character.dart';

@immutable
abstract class ListCharacterState {}

class Loading extends ListCharacterState {}

class WithError extends Equatable implements ListCharacterState {
  final String message;

  WithError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class Loaded extends Equatable implements ListCharacterState {
  final List<Character> list;
  final bool finish;
  final bool loading;
  final int page;

  Loaded(
      {required this.list,
      this.finish = false,
      this.loading = false,
      this.page = 1});

  @override
  List get props => [list, finish, loading, page];

  Loaded copyWith(
          {List<Character>? list, bool? finish, bool? loading, int? page}) =>
      Loaded(
        loading: loading ?? this.loading,
        finish: finish ?? this.finish,
        page: page ?? this.page,
        list: list ?? this.list,
      );
}

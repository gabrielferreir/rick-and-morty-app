import 'package:equatable/equatable.dart';
import '../../domain/entities/character.dart';

class ListCharacterState extends Equatable {
  final List<Character> list;
  final bool finish;
  final bool isLoading;
  final bool loading;
  final int page;
  final String? message;

  ListCharacterState({
    this.list = const [],
    this.finish = false,
    this.isLoading = false,
    this.loading = false,
    this.page = 1,
    this.message,
  });

  @override
  List get props => [isLoading,
    // list,
    finish, loading, page, message];

  ListCharacterState copyWith({
    List<Character>? list,
    bool? finish,
    bool? loading,
    bool? isLoading,
    int? page,
    String? message,
  }) =>
      ListCharacterState(
        loading: loading ?? this.loading,
        isLoading: isLoading ?? this.isLoading,
        finish: finish ?? this.finish,
        page: page ?? this.page,
        list: list ?? this.list,
        message: message ?? this.message,
      );
}

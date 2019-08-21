import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/repository/character_repository.dart';
import './bloc.dart';

class ListCharacterBloc extends Bloc<ListCharacterEvent, ListCharacterState> {
  final CharacterRepository characterRepository;

  ListCharacterBloc({@required this.characterRepository});

  @override
  ListCharacterState get initialState => Loading();

  @override
  Stream<ListCharacterState> mapEventToState(
    ListCharacterEvent event,
  ) async* {
    if (event is Started) {
      try {
        final list = await characterRepository.get();
        yield Loaded(list: list);
      } catch (e) {
        print(e);
      }
    }
  }
}

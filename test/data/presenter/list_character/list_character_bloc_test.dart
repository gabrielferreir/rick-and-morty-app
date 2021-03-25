import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/domain/usecase/search_characters.dart';
import 'package:rickandmorty/presenter/list_character/list_character_bloc.dart';
import 'package:rickandmorty/presenter/list_character/list_character_event.dart';
import 'package:rickandmorty/presenter/list_character/list_character_state.dart';
import 'package:test/test.dart';

class SearchCharactersUseCaseMock extends Mock
    implements SearchCharactersUseCase {}

final listCharacterMock = [
  Character(
      id: 1,
      name: 'A',
      episode: [],
      status: 'A',
      location: 'A',
      origin: 'A',
      species: 'species',
      gender: 'gender',
      image: 'image'),
  Character(
      id: 1,
      name: 'A',
      episode: [],
      status: 'A',
      location: 'A',
      origin: 'A',
      species: 'species',
      gender: 'gender',
      image: 'image'),
  Character(
      id: 1,
      name: 'A',
      episode: [],
      status: 'A',
      location: 'A',
      origin: 'A',
      species: 'species',
      gender: 'gender',
      image: 'image'),
  Character(
      id: 1,
      name: 'A',
      episode: [],
      status: 'A',
      location: 'A',
      origin: 'A',
      species: 'species',
      gender: 'gender',
      image: 'image'),
  Character(
      id: 1,
      name: 'A',
      episode: [],
      status: 'A',
      location: 'A',
      origin: 'A',
      species: 'species',
      gender: 'gender',
      image: 'image'),
  Character(
      id: 1,
      name: 'A',
      episode: [],
      status: 'A',
      location: 'A',
      origin: 'A',
      species: 'species',
      gender: 'gender',
      image: 'image'),
  Character(
      id: 1,
      name: 'A',
      episode: [],
      status: 'A',
      location: 'A',
      origin: 'A',
      species: 'species',
      gender: 'gender',
      image: 'image'),
  Character(
      id: 1,
      name: 'A',
      episode: [],
      status: 'A',
      location: 'A',
      origin: 'A',
      species: 'species',
      gender: 'gender',
      image: 'image'),
  Character(
      id: 1,
      name: 'A',
      episode: [],
      status: 'A',
      location: 'A',
      origin: 'A',
      species: 'species',
      gender: 'gender',
      image: 'image'),
  Character(
      id: 1,
      name: 'A',
      episode: [],
      status: 'A',
      location: 'A',
      origin: 'A',
      species: 'species',
      gender: 'gender',
      image: 'image'),
  Character(
      id: 1,
      name: 'A',
      episode: [],
      status: 'A',
      location: 'A',
      origin: 'A',
      species: 'species',
      gender: 'gender',
      image: 'image'),
  Character(
      id: 1,
      name: 'A',
      episode: [],
      status: 'A',
      location: 'A',
      origin: 'A',
      species: 'species',
      gender: 'gender',
      image: 'image'),
  Character(
      id: 1,
      name: 'A',
      episode: [],
      status: 'A',
      location: 'A',
      origin: 'A',
      species: 'species',
      gender: 'gender',
      image: 'image'),
  Character(
      id: 1,
      name: 'A',
      episode: [],
      status: 'A',
      location: 'A',
      origin: 'A',
      species: 'species',
      gender: 'gender',
      image: 'image'),
  Character(
      id: 1,
      name: 'A',
      episode: [],
      status: 'A',
      location: 'A',
      origin: 'A',
      species: 'species',
      gender: 'gender',
      image: 'image'),
  Character(
      id: 1,
      name: 'A',
      episode: [],
      status: 'A',
      location: 'A',
      origin: 'A',
      species: 'species',
      gender: 'gender',
      image: 'image'),
  Character(
      id: 1,
      name: 'A',
      episode: [],
      status: 'A',
      location: 'A',
      origin: 'A',
      species: 'species',
      gender: 'gender',
      image: 'image'),
  Character(
      id: 1,
      name: 'A',
      episode: [],
      status: 'A',
      location: 'A',
      origin: 'A',
      species: 'species',
      gender: 'gender',
      image: 'image'),
  Character(
      id: 1,
      name: 'A',
      episode: [],
      status: 'A',
      location: 'A',
      origin: 'A',
      species: 'species',
      gender: 'gender',
      image: 'image'),
  Character(
      id: 1,
      name: 'A',
      episode: [],
      status: 'A',
      location: 'A',
      origin: 'A',
      species: 'species',
      gender: 'gender',
      image: 'image'),
  Character(
      id: 1,
      name: 'A',
      episode: [],
      status: 'A',
      location: 'A',
      origin: 'A',
      species: 'species',
      gender: 'gender',
      image: 'image'),
];

final listCharacterMock2 = [
  Character(
      id: 1,
      name: 'A',
      episode: [],
      status: 'A',
      location: 'A',
      origin: 'A',
      species: 'species',
      gender: 'gender',
      image: 'image'),
  Character(
      id: 1,
      name: 'A',
      episode: [],
      status: 'A',
      location: 'A',
      origin: 'A',
      species: 'species',
      gender: 'gender',
      image: 'image'),
];

void main() {
  group('ListCharacterBloc', () {
    ListCharacterBloc listCharacterBloc;
    SearchCharactersUseCaseMock searchCharactersUseCaseMock;

    setUp(() {
      searchCharactersUseCaseMock = SearchCharactersUseCaseMock();
      listCharacterBloc = ListCharacterBloc(
        searchCharactersUseCase: searchCharactersUseCaseMock,
      );
    });

    test('Initial state is loading', () {
      expect(listCharacterBloc.state.toString(), Loading().toString());
    });

    blocTest(
      'Should be search characters',
      build: () {
        when(searchCharactersUseCaseMock.call()).thenAnswer((_) async => []);
        return listCharacterBloc;
      },
      act: (bloc) async => bloc..add(Started()),
      expect: () => [Loaded(list: [], finish: true, loading: false, page: 1)],
    );

    blocTest(
      'Should be find a dioError when search characters',
      build: () {
        when(searchCharactersUseCaseMock.call())
            .thenThrow(DioError(response: Response(data: 'Error :)')));
        return listCharacterBloc;
      },
      act: (bloc) async => bloc..add(Started()),
      expect: () => [WithError(message: 'Error :)')],
    );

    blocTest(
      'Should be find a exception when search characters',
      build: () {
        when(searchCharactersUseCaseMock.call())
            .thenThrow(Exception('Error :)'));
        return listCharacterBloc;
      },
      act: (bloc) async => bloc..add(Started()),
      expect: () => [WithError(message: 'Internal server error')],
    );

    blocTest(
      'Should be search characters paginate',
      build: () {
        when(searchCharactersUseCaseMock.call(page: 1))
            .thenAnswer((_) async => listCharacterMock);
        when(searchCharactersUseCaseMock.call(page: 2))
            .thenAnswer((_) async => listCharacterMock2);
        return listCharacterBloc;
      },
      act: (bloc) async => bloc..add(Started())..add(Fetch(page: 2)),
      expect: () => [
        Loaded(list: listCharacterMock, finish: false, loading: false, page: 1),
        Loaded(list: listCharacterMock, finish: false, loading: true, page: 1),
        Loaded(list: [
          ...listCharacterMock,
          ...listCharacterMock2,
        ], finish: true, loading: false, page: 2),
      ],
    );

    blocTest(
      'Should be find a dioError when search characters paginate',
      build: () {
        when(searchCharactersUseCaseMock.call(page: 1))
            .thenAnswer((_) async => listCharacterMock);
        when(searchCharactersUseCaseMock.call(page: 2))
            .thenThrow(DioError(response: Response(data: 'Error :)')));
        return listCharacterBloc;
      },
      act: (bloc) async => bloc..add(Started())..add(Fetch(page: 2)),
      expect: () => [
        Loaded(list: listCharacterMock, finish: false, loading: false, page: 1),
        Loaded(list: listCharacterMock, finish: false, loading: true, page: 1),
        WithError(message: 'Error :)'),
      ],
    );

    blocTest(
      'Should be find a exception when search characters',
      build: () {
        when(searchCharactersUseCaseMock.call(page: 1))
            .thenAnswer((_) async => listCharacterMock);
        when(searchCharactersUseCaseMock.call(page: 2))
            .thenThrow(Exception('Error :)'));
        return listCharacterBloc;
      },
      act: (bloc) async => bloc..add(Started())..add(Fetch(page: 2)),
      expect: () => [
        Loaded(list: listCharacterMock, finish: false, loading: false, page: 1),
        Loaded(list: listCharacterMock, finish: false, loading: true, page: 1),
        WithError(message: 'Internal server error'),
      ],
    );
  });
}

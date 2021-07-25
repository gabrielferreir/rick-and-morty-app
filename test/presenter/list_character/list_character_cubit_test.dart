import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/domain/usecase/search_characters.dart';
import 'package:rickandmorty/presenter/list_character/list_character_bloc.dart';
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
    late ListCharacterCubit listCharacterCubit;
    late SearchCharactersUseCaseMock searchCharactersUseCaseMock;

    setUp(() {
      searchCharactersUseCaseMock = SearchCharactersUseCaseMock();
      listCharacterCubit = ListCharacterCubit(
        searchCharactersUseCase: searchCharactersUseCaseMock,
      );
    });

    test('Initial state is loading', () {
      expect(listCharacterCubit.state.toString(),
          ListCharacterState(isLoading: true).toString());
    });

    blocTest('Should be search characters',
        build: () {
          when(() => searchCharactersUseCaseMock.call(page: any(named: 'page')))
              .thenAnswer((_) async => listCharacterMock);
          return listCharacterCubit;
        },
        act: (bloc) async => (bloc as ListCharacterCubit)..started(),
        expect: () => [
              ListCharacterState(isLoading: true),
              ListCharacterState(
                list: listCharacterMock,
                page: 1,
                finish: false,
                loading: false,
              )
            ]);

    blocTest('Should be find a dioError when search characters',
        build: () {
          when(searchCharactersUseCaseMock.call).thenThrow(DioError(
              requestOptions: RequestOptions(path: ''),
              response: Response(
                  data: 'Error :)', requestOptions: RequestOptions(path: ''))));
          return listCharacterCubit;
        },
        act: (bloc) async => (bloc as ListCharacterCubit)..started(),
        expect: () => [
              ListCharacterState(isLoading: true),
              ListCharacterState(message: 'Error :)')
            ]);

    blocTest('Should be find a exception when search characters',
        build: () {
          when(searchCharactersUseCaseMock.call)
              .thenThrow(Exception('Error :)'));
          return listCharacterCubit;
        },
        act: (bloc) async => (bloc as ListCharacterCubit)..started(),
        expect: () => [
              ListCharacterState(isLoading: true),
              ListCharacterState(message: 'Internal server error')
            ]);

    blocTest('Should be search characters paginate',
        build: () {
          listCharacterCubit.emit(ListCharacterState(list: listCharacterMock));
          when(() => searchCharactersUseCaseMock.call(page: 2))
              .thenAnswer((_) async => listCharacterMock2);
          return listCharacterCubit;
        },
        act: (bloc) async => (bloc as ListCharacterCubit)..fetch(page: 2),
        expect: () => [
              ListCharacterState(list: listCharacterMock, loading: true),
              ListCharacterState(
                  list: [...listCharacterMock, ...listCharacterMock2],
                  finish: true,
                  page: 2)
            ]);

    blocTest('Should be find a dioError when search characters paginate',
        build: () {
          listCharacterCubit.emit(ListCharacterState(list: listCharacterMock));
          when(() => searchCharactersUseCaseMock.call(page: 2)).thenThrow(
              DioError(
                  requestOptions: RequestOptions(path: ''),
                  response: Response(
                      data: 'Error :)',
                      requestOptions: RequestOptions(path: ''))));
          return listCharacterCubit;
        },
        act: (bloc) async => (bloc as ListCharacterCubit)..fetch(page: 2),
        expect: () => [
              ListCharacterState(
                  list: listCharacterMock, loading: true, page: 1),
              ListCharacterState(message: 'Error :)')
            ]);

    blocTest('Should be find a exception when search characters',
        build: () {
          listCharacterCubit.emit(ListCharacterState(list: listCharacterMock));
          when(() => searchCharactersUseCaseMock.call(page: 2))
              .thenThrow(Exception('Error :)'));
          return listCharacterCubit;
        },
        act: (bloc) async => (bloc as ListCharacterCubit)..fetch(page: 2),
        expect: () => [
              ListCharacterState(list: listCharacterMock, loading: true),
              ListCharacterState(message: 'Internal server error')
            ]);
  });
}

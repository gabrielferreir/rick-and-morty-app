import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/presenter/list_character/list_character_bloc.dart';
import 'package:rickandmorty/presenter/list_character/list_character_content.dart';
import 'package:rickandmorty/presenter/list_character/list_character_event.dart';
import 'package:rickandmorty/presenter/list_character/list_character_state.dart';

import '../../fake_cache_manager.dart';

class ListCharacterBlocMock
    extends MockBloc<ListCharacterEvent, ListCharacterState>
    implements ListCharacterBloc {}

class ListCharacterStateMock extends Fake implements ListCharacterState {}

class ListCharacterEventMock extends Fake implements ListCharacterEvent {}

const _loadingKey = Key('list_character_loading');
const _errorMessageKey = Key('list_character_errors_message');
const _contentLoadedKey = Key('list_character_container_loaded');
const _gridListKey = Key('list_character_grid_list');

final rick = Character(
    id: 1,
    name: 'Rick Sanchez',
    location: "Earth (Replacement Dimension)",
    gender: 'Male',
    origin: 'Earth (C-137)',
    species: 'Human',
    status: 'Alive',
    episode: [
      "https://rickandmortyapi.com/api/episode/1",
      "https://rickandmortyapi.com/api/episode/2",
      "https://rickandmortyapi.com/api/episode/3",
      "https://rickandmortyapi.com/api/episode/4",
      "https://rickandmortyapi.com/api/episode/5",
      "https://rickandmortyapi.com/api/episode/6",
      "https://rickandmortyapi.com/api/episode/7",
      "https://rickandmortyapi.com/api/episode/8",
      "https://rickandmortyapi.com/api/episode/9",
      "https://rickandmortyapi.com/api/episode/10",
      "https://rickandmortyapi.com/api/episode/11",
      "https://rickandmortyapi.com/api/episode/12",
      "https://rickandmortyapi.com/api/episode/13",
      "https://rickandmortyapi.com/api/episode/14",
      "https://rickandmortyapi.com/api/episode/15",
      "https://rickandmortyapi.com/api/episode/16",
      "https://rickandmortyapi.com/api/episode/17",
      "https://rickandmortyapi.com/api/episode/18",
      "https://rickandmortyapi.com/api/episode/19",
      "https://rickandmortyapi.com/api/episode/20",
      "https://rickandmortyapi.com/api/episode/21",
      "https://rickandmortyapi.com/api/episode/22",
      "https://rickandmortyapi.com/api/episode/23",
      "https://rickandmortyapi.com/api/episode/24",
      "https://rickandmortyapi.com/api/episode/25",
      "https://rickandmortyapi.com/api/episode/26",
      "https://rickandmortyapi.com/api/episode/27",
      "https://rickandmortyapi.com/api/episode/28",
      "https://rickandmortyapi.com/api/episode/29",
      "https://rickandmortyapi.com/api/episode/30",
      "https://rickandmortyapi.com/api/episode/31",
      "https://rickandmortyapi.com/api/episode/32",
      "https://rickandmortyapi.com/api/episode/33",
      "https://rickandmortyapi.com/api/episode/34",
      "https://rickandmortyapi.com/api/episode/35",
      "https://rickandmortyapi.com/api/episode/36",
      "https://rickandmortyapi.com/api/episode/37",
      "https://rickandmortyapi.com/api/episode/38",
      "https://rickandmortyapi.com/api/episode/39",
      "https://rickandmortyapi.com/api/episode/40",
      "https://rickandmortyapi.com/api/episode/41"
    ],
    image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg');

final rick20 = [
  rick,
  rick,
  rick,
  rick,
  rick,
  rick,
  rick,
  rick,
  rick,
  rick,
  rick,
  rick,
  rick,
  rick,
  rick,
  rick,
  rick,
  rick,
  rick,
  rick,
];

void main() {
  FakeCacheManager cacheManager;
  ListCharacterBloc listCharacterBlocMock;

  setUpAll(() {
    registerFallbackValue<ListCharacterEvent>(ListCharacterEventMock());
    registerFallbackValue<ListCharacterState>(ListCharacterStateMock());
  });

  setUp(() {
    cacheManager = FakeCacheManager();
    listCharacterBlocMock = ListCharacterBlocMock();
    GetIt.I.registerSingleton<BaseCacheManager>(cacheManager);
  });

  tearDown(() {
    GetIt.I.unregister<BaseCacheManager>();
  });

  group('ListCharacterContent', () {
    testWidgets('render loading', (tester) async {
      when(() => listCharacterBlocMock.state).thenReturn(Loading());
      await tester.pumpWidget(MaterialApp(
          home: BlocProvider.value(
              value: listCharacterBlocMock, child: ListCharacterContent())));
      expect(find.byKey(_loadingKey), findsOneWidget);
    });

    testWidgets('render with error', (tester) async {
      when(() => listCharacterBlocMock.state)
          .thenReturn(WithError(message: ''));
      await tester.pumpWidget(MaterialApp(
          home: BlocProvider.value(
              value: listCharacterBlocMock, child: ListCharacterContent())));
      expect(find.byKey(_errorMessageKey), findsOneWidget);
    });

    testWidgets('render loaded empty list', (tester) async {
      when(() => listCharacterBlocMock.state)
          .thenReturn(Loaded(list: [], finish: false, loading: false, page: 1));
      await tester.pumpWidget(MaterialApp(
          home: BlocProvider.value(
              value: listCharacterBlocMock, child: ListCharacterContent())));
      expect(find.byKey(_contentLoadedKey), findsOneWidget);
    });

    testWidgets('render loaded with a list', (tester) async {
      when(() => listCharacterBlocMock.state)
          .thenReturn(Loaded(list: [rick], finish: true));
      await tester.pumpWidget(MaterialApp(
          home: BlocProvider.value(
              value: listCharacterBlocMock, child: ListCharacterContent())));
      expect(find.byKey(_contentLoadedKey), findsOneWidget);
    });

    testWidgets('should call load more', (tester) async {
      when(() => listCharacterBlocMock.state).thenReturn(Loaded(
        list: rick20,
        finish: false,
      ));
      await tester.pumpWidget(MaterialApp(
          home: BlocProvider.value(
              value: listCharacterBlocMock, child: ListCharacterContent())));
      await tester.drag(find.byKey(_gridListKey), const Offset(0.0, -4110));
      verify(() => listCharacterBlocMock.add(const Fetch(page: 2))).called(1);
    });
  });
}

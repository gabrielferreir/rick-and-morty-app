import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/presenter/character/character_bloc.dart';
import 'package:rickandmorty/presenter/character/character_page.dart';
import 'package:rickandmorty/presenter/character/character_state.dart';
import 'package:rickandmorty/presenter/episodes/episodes_bloc.dart';
import 'package:rickandmorty/presenter/episodes/episodes_event.dart';
import 'package:rickandmorty/presenter/episodes/episodes_state.dart';

import '../../fake_cache_manager.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class EpisodesBlocMock extends MockBloc<EpisodesEvent, EpisodesState>
    implements EpisodesBloc {}

class CharacterCubitMock extends MockCubit<CharacterState>
    implements CharacterCubit {}

class EpisodesStateMock extends Fake implements EpisodesState {}

class CharacterStateMock extends Fake implements CharacterState {}

class EpisodesEventMock extends Fake implements EpisodesEvent {}

class RouteFake extends Fake implements Route<dynamic> {}

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
    ],
    image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg');

void main() {
  late FakeCacheManager cacheManager;
  late EpisodesBloc episodesBloc;
  late CharacterCubit characterCubitMock;

  group('CharacterPage', () {
    setUpAll(() {
      registerFallbackValue<EpisodesState>(EpisodesStateMock());
      registerFallbackValue<EpisodesEvent>(EpisodesEventMock());
      registerFallbackValue<CharacterState>(CharacterStateMock());
      registerFallbackValue<Map<String, String>>(<String, String>{});
      registerFallbackValue<Route<dynamic>>(RouteFake());
    });

    setUp(() {
      cacheManager = FakeCacheManager();
      episodesBloc = EpisodesBlocMock();
      characterCubitMock = CharacterCubitMock();
      GetIt.I.registerSingleton<BaseCacheManager>(cacheManager);
      GetIt.I.registerFactory<EpisodesBloc>(() => episodesBloc);
      GetIt.I.registerFactory<CharacterCubit>(() => characterCubitMock);
    });

    tearDown(() {
      GetIt.I.unregister<BaseCacheManager>();
      GetIt.I.unregister<EpisodesBloc>();
      GetIt.I.unregister<CharacterCubit>();
    });

    testWidgets('Render CharacterPage', (tester) async {
      when(() => characterCubitMock.state).thenReturn(CharacterState());
      await tester
          .pumpWidget(MaterialApp(home: CharacterPage(character: rick)));
      expect(find.byType(CharacterPage), findsOneWidget);
    });
  });
}

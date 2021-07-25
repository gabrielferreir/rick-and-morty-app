import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/presenter/character/character_page.dart';
import 'package:rickandmorty/presenter/episodes/episodes_bloc.dart';
import 'package:rickandmorty/presenter/episodes/episodes_event.dart';
import 'package:rickandmorty/presenter/episodes/episodes_state.dart';

import '../../fake_cache_manager.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class EpisodesBlocMock extends MockBloc<EpisodesEvent, EpisodesState>
    implements EpisodesBloc {}

class EpisodesStateMock extends Fake implements EpisodesState {}

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
final _episodeCardKey =
    Key('episode_card_ep_https://rickandmortyapi.com/api/episode/1');

void main() {
  FakeCacheManager cacheManager;
  EpisodesBlocMock episodesBloc;

  setUpAll(() {
    registerFallbackValue<EpisodesState>(EpisodesStateMock());
    registerFallbackValue<EpisodesEvent>(EpisodesEventMock());
    registerFallbackValue<Map<String, String>>(<String, String>{});
    registerFallbackValue<Route<dynamic>>(RouteFake());
  });

  setUp(() {
    cacheManager = FakeCacheManager();
    episodesBloc = EpisodesBlocMock();
    GetIt.I.registerSingleton<BaseCacheManager>(cacheManager);
    GetIt.I.registerFactory<EpisodesBloc>(() => episodesBloc);
  });

  tearDown(() {
    GetIt.I.unregister<BaseCacheManager>();
    GetIt.I.unregister<EpisodesBloc>();
    PaintingBinding.instance?.imageCache?.clear();
    PaintingBinding.instance?.imageCache?.clearLiveImages();
  });

  group('CharacterPage', () {
    testWidgets('Render CharacterPage', (tester) async {
      await tester
          .pumpWidget(MaterialApp(home: CharacterPage(character: rick)));
      expect(find.byType(CharacterPage), findsOneWidget);
    });

    testWidgets('Should open bottom sheet', (tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: CharacterPage(character: rick),
        navigatorObservers: [mockObserver],
      ));
      expect(find.byKey(_episodeCardKey), findsOneWidget);
      await tester.tap(find.byKey(_episodeCardKey));
      await tester.pumpAndSettle();
      verify(() => mockObserver.didPush(any(), any())).called(2);
    });
  });
}

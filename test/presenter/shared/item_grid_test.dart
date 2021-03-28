import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/presenter/episodes/episodes_bloc.dart';
import 'package:rickandmorty/presenter/episodes/episodes_event.dart';
import 'package:rickandmorty/presenter/episodes/episodes_state.dart';
import 'package:rickandmorty/presenter/shared/item_grid.dart';

import '../../fake_cache_manager.dart';
import '../../image_data.dart';

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
final _imageErrorKey = Key('item_grid_image_error');
final _inkwellKey = Key('item_grid_inkwell');

void main() {
  FakeCacheManager cacheManager;
  EpisodesBlocMock episodesBloc;

  setUpAll(() {
    registerFallbackValue<EpisodesState>(EpisodesStateMock());
    registerFallbackValue<EpisodesEvent>(EpisodesEventMock());
    registerFallbackValue<Map<String, String>>(Map<String, String>());
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
  });

  group('ItemGrid', () {
    testWidgets('Render ItemGrid', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ItemGrid(character: rick)));
      expect(find.byType(ItemGrid), findsOneWidget);
    });

    testWidgets('Render CharacterPage image with error', (tester) async {
      cacheManager.throwsNotFound(rick.image);
      await tester.pumpWidget(MaterialApp(home: ItemGrid(character: rick)));
      await tester.pump();
      expect(find.byKey(_imageErrorKey), findsOneWidget);
    });

    testWidgets('Should be navigate to character', (tester) async {
      final mockObserver = MockNavigatorObserver();
      cacheManager.returns(rick.image, kTransparentImage);
      await tester.pumpWidget(MaterialApp(
        home: ItemGrid(character: rick),
        navigatorObservers: [mockObserver],
      ));
      await tester.tap(find.byKey(_inkwellKey));
      await tester.pump();
      verify(() => mockObserver.didPush(any(), any())).called(2);
    });
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/domain/entities/episodes.dart';
import 'package:rickandmorty/presenter/character/character_bloc.dart';
import 'package:rickandmorty/presenter/character/character_content.dart';
import 'package:rickandmorty/presenter/character/character_page.dart';
import 'package:rickandmorty/presenter/character/character_state.dart';
import 'package:rickandmorty/presenter/episodes/episodes_bloc.dart';
import 'package:rickandmorty/presenter/episodes/episodes_event.dart';
import 'package:rickandmorty/presenter/episodes/episodes_state.dart';

import '../../fake_cache_manager.dart';
import '../../image_data.dart';

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

final _episodeCardKey =
    Key('episode_card_ep_https://rickandmortyapi.com/api/episode/1');

void main() {
  late FakeCacheManager cacheManager;
  late EpisodesBloc episodesBloc;
  late CharacterCubit characterCubitMock;

  group('CharacterContent', () {
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

    testWidgets('Render CharacterContent', (tester) async {
      when(() => characterCubitMock.state).thenReturn(CharacterState());
      await tester.pumpWidget(MaterialApp(
          home: BlocProvider(
              create: (context) => characterCubitMock,
              child: CharacterContent(character: rick))));
      expect(find.byType(CharacterPage), findsOneWidget);
    });

    testWidgets('Should show message', (tester) async {
      when(() => characterCubitMock.state).thenReturn(CharacterState());
      whenListen(
          characterCubitMock,
          Stream.fromIterable([
            CharacterState(isLoading: true),
            CharacterState(message: 'Message'),
          ]));
      when(() => episodesBloc.state).thenReturn(Loaded(
          episodes:
              Episodes(id: 1, episode: '1', airDate: '', name: '', list: [])));
      await tester
          .pumpWidget(MaterialApp(home: CharacterPage(character: rick)));
      await tester.pump();
      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('Should open bottom sheet', (tester) async {
      when(() => characterCubitMock.state).thenReturn(CharacterState());
      when(() => episodesBloc.state).thenReturn(Loaded(
          episodes:
              Episodes(id: 1, episode: '1', airDate: '', name: '', list: [])));
      cacheManager.returns(
          'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
          kTransparentImage);

      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: CharacterPage(character: rick),
          navigatorObservers: [mockObserver]));
      expect(find.byKey(_episodeCardKey), findsOneWidget);
      await tester.tap(find.byKey(_episodeCardKey));
      await tester.pump();
      await tester.pump(Duration(seconds: 1));
      verify(() => mockObserver.didPush(any(), any())).called(2);
    });
  });
}

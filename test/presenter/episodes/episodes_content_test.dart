import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rickandmorty/domain/entities/episodes.dart';
import 'package:rickandmorty/presenter/episodes/episodes_bloc.dart';
import 'package:rickandmorty/presenter/episodes/episodes_content.dart';
import 'package:rickandmorty/presenter/episodes/episodes_event.dart';
import 'package:rickandmorty/presenter/episodes/episodes_state.dart';

import '../../fake_cache_manager.dart';
import '../character/character_page_test.dart';

class EpisodesBlocMock extends MockBloc<EpisodesEvent, EpisodesState>
    implements EpisodesBloc {}

class EpisodesStateMock extends Fake implements EpisodesState {}

class EpisodesEventMock extends Fake implements EpisodesEvent {}

const _loadingKey = Key('episodes_loading');
const _errorMessageKey = Key('episodes_error_message');
const _contentLoadedKey = Key('episodes_container_loaded');

final episodeMock = Episodes(
    id: 1, episode: '1', name: 'Nome', list: [rick], airDate: '23/10/2018');

void main() {
  FakeCacheManager cacheManager = FakeCacheManager();
  EpisodesBloc episodesBlocMock;

  setUpAll(() {
    registerFallbackValue<EpisodesEvent>(EpisodesEventMock());
    registerFallbackValue<EpisodesState>(EpisodesStateMock());
    registerFallbackValue<Map<String, String>>(Map<String, String>());
  });

  setUp(() {
    GetIt.I.registerSingleton<BaseCacheManager>(cacheManager);
    episodesBlocMock = EpisodesBlocMock();
  });

  tearDown(() async {
    await cacheManager.emptyCache();
    GetIt.I.unregister<BaseCacheManager>();
  });

  group('EpisodesContent', () {
    testWidgets('render loading', (tester) async {
      when(() => episodesBlocMock.state).thenReturn(Loading());
      await tester.pumpWidget(MaterialApp(
          home: BlocProvider.value(
              value: episodesBlocMock, child: EpisodesContent())));
      expect(find.byKey(_loadingKey), findsOneWidget);
    });

    testWidgets('render with error', (tester) async {
      when(() => episodesBlocMock.state).thenReturn(WithError(message: ''));
      await tester.pumpWidget(MaterialApp(
          home: BlocProvider.value(
              value: episodesBlocMock, child: EpisodesContent())));
      expect(find.byKey(_errorMessageKey), findsOneWidget);
    });

    testWidgets('render loaded with a list', (tester) async {
      when(() => episodesBlocMock.state)
          .thenReturn(Loaded(episodes: episodeMock));
      await tester.pumpWidget(MaterialApp(
          home: BlocProvider.value(
              value: episodesBlocMock, child: EpisodesContent())));
      expect(find.byKey(_contentLoadedKey), findsOneWidget);
    });
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rickandmorty/presenter/episodes/episodes_bloc.dart';
import 'package:rickandmorty/presenter/episodes/episodes_event.dart';
import 'package:rickandmorty/presenter/episodes/episodes_page.dart';
import 'package:rickandmorty/presenter/episodes/episodes_state.dart';

class EpisodesBlocMock extends MockBloc<EpisodesEvent, EpisodesState>
    implements EpisodesBloc {}

class EpisodesStateMock extends Fake implements EpisodesState {}

class EpisodesEventMock extends Fake implements EpisodesEvent {}

void main() {
  EpisodesBloc episodesBloc;

  setUpAll(() {
    registerFallbackValue<EpisodesEvent>(EpisodesEventMock());
    registerFallbackValue<EpisodesState>(EpisodesStateMock());
  });

  setUp(() {
    episodesBloc = EpisodesBlocMock();
    GetIt.I.registerFactory<EpisodesBloc>(() => episodesBloc);
  });

  tearDown(() {
    GetIt.I.unregister<EpisodesBloc>();
  });

  group('EpisodesPage', () {
    testWidgets('Render EpisodesPage', (tester) async {
      await tester.pumpWidget(MaterialApp(home: EpisodesPage(episode: 1)));
      expect(find.byType(EpisodesPage), findsOneWidget);
    });

    testWidgets('Should be call event Started', (tester) async {
      await tester.pumpWidget(MaterialApp(
          home: EpisodesPage(
        episode: 1,
      )));
      verify(() => episodesBloc.add(const Started(id: 1))).called(1);
    });
  });
}

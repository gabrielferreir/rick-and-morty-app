import 'package:mockito/mockito.dart';
import 'package:rickandmorty/domain/usecase/search_episode.dart';
import 'package:rickandmorty/presenter/episodes/episodes_bloc.dart';
import 'package:rickandmorty/presenter/episodes/episodes_state.dart';
import 'package:test/test.dart';

class SearchEpisodeUseCaseMock extends Mock implements SearchEpisodeUseCase {}

void main() {
  group('ListCharacterBloc', () {
    EpisodesBloc episodesBloc;
    SearchEpisodeUseCaseMock searchEpisodeUseCaseMock;

    setUp(() {
      searchEpisodeUseCaseMock = SearchEpisodeUseCaseMock();
      episodesBloc = EpisodesBloc(
        searchEpisodeUseCase: searchEpisodeUseCaseMock,
      );
    });

    test('Initial state is loading', () {
      expect(episodesBloc.state.toString(), Loading().toString());
    });

    // blocTest(
    //   'Should be search characters',
    //   build: () {
    //     when(searchCharactersUseCaseMock.call()).thenAnswer((_) async => []);
    //     return listCharacterBloc;
    //   },
    //   act: (bloc) async => bloc..add(Started()),
    //   expect: () => [Loaded(list: [], finish: true, loading: false, page: 1)],
    // );
  });
}

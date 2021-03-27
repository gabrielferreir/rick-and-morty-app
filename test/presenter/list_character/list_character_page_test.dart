import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rickandmorty/presenter/list_character/list_character_bloc.dart';
import 'package:rickandmorty/presenter/list_character/list_character_event.dart';
import 'package:rickandmorty/presenter/list_character/list_character_page.dart';
import 'package:rickandmorty/presenter/list_character/list_character_state.dart';

class ListCharacterBlocMock
    extends MockBloc<ListCharacterEvent, ListCharacterState>
    implements ListCharacterBloc {}

class ListCharacterStateMock extends Fake implements ListCharacterState {}

class ListCharacterEventMock extends Fake implements ListCharacterEvent {}

void main() {
  ListCharacterBloc listCharacterBloc;

  setUpAll(() {
    registerFallbackValue<ListCharacterEvent>(ListCharacterEventMock());
    registerFallbackValue<ListCharacterState>(ListCharacterStateMock());
  });

  setUp(() {
    listCharacterBloc = ListCharacterBlocMock();
    GetIt.I.registerFactory<ListCharacterBloc>(() => listCharacterBloc);
  });

  tearDown(() {
    GetIt.I.unregister<ListCharacterBloc>();
  });

  group('ListCharacterPage', () {
    testWidgets('Render ListCharacterPage', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ListCharacterPage()));
      expect(find.byType(ListCharacterPage), findsOneWidget);
    });

    testWidgets('Should be call event Started', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ListCharacterPage()));
      verify(() => listCharacterBloc.add(const Started())).called(1);
    });
  });
}

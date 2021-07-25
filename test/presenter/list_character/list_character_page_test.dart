import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rickandmorty/presenter/list_character/list_character_bloc.dart';
import 'package:rickandmorty/presenter/list_character/list_character_page.dart';
import 'package:rickandmorty/presenter/list_character/list_character_state.dart';

class ListCharacterCubitMock extends MockCubit<ListCharacterState>
    implements ListCharacterCubit {}

class ListCharacterStateMock extends Fake implements ListCharacterState {}

void main() {
  late ListCharacterCubit listCharacterCubit;

  setUpAll(() {
    registerFallbackValue<ListCharacterState>(ListCharacterStateMock());
  });

  setUp(() {
    listCharacterCubit = ListCharacterCubitMock();
    GetIt.I.registerFactory<ListCharacterCubit>(() => listCharacterCubit);
  });

  tearDown(() {
    GetIt.I.unregister<ListCharacterCubit>();
  });

  group('ListCharacterPage', () {
    testWidgets('Render ListCharacterPage', (tester) async {
      when(() => listCharacterCubit.state)
          .thenReturn(ListCharacterState(isLoading: true));
      await tester.pumpWidget(MaterialApp(home: ListCharacterPage()));
      expect(find.byType(ListCharacterPage), findsOneWidget);
    });

    testWidgets('Should be call event Started', (tester) async {
      when(() => listCharacterCubit.state)
          .thenReturn(ListCharacterState(isLoading: true));
      await tester.pumpWidget(MaterialApp(home: ListCharacterPage()));
      verify(() => listCharacterCubit.started()).called(1);
    });
  });
}

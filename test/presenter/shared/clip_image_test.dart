import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rickandmorty/presenter/shared/clip_image.dart';

import '../../fake_cache_manager.dart';
import '../character/character_page_test.dart';

class RouteFake extends Fake implements Route<dynamic> {}

final _imageError = Key('clip_image_error');

void main() {
  FakeCacheManager cacheManager;

  setUpAll(() {
    registerFallbackValue<Map<String, String>>(Map<String, String>());
  });

  setUp(() {
    cacheManager = FakeCacheManager();
    GetIt.I.registerSingleton<BaseCacheManager>(cacheManager);
  });

  tearDown(() {
    GetIt.I.unregister<BaseCacheManager>();
  });

  group('ItemGrid', () {
    testWidgets('Render image with error', (tester) async {
      cacheManager.throwsNotFound(rick.image);
      await tester.pumpWidget(MaterialApp(home: ClipImage(url: rick.image)));
      await tester.pump();
      expect(find.byKey(_imageError), findsOneWidget);
    });
  });
}

import 'dart:io';

import 'package:communere/app/di/main_binding.dart';
import 'package:communere/app/network/network_client.dart';
import 'package:communere/presentation/components/photo_list.dart';
import 'package:communere/presentation/components/skeleton_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:communere/presentation/home/home_screen.dart';
import 'package:mockito/mockito.dart';

class MockNetworkClient extends Mock implements NetworkClient {}

void main() {


  group('HomeScreen Widget Tests', () {

    setUpAll(() {
      MainBinding().dependencies();
      dotenv.testLoad(fileInput: File('test/assets/.env').readAsStringSync());



    });

    testWidgets('Renders SkeletonList when loading', (WidgetTester tester) async {

      await tester.pumpWidget(
        MaterialApp(
          home: HomeScreen(key: UniqueKey()),
        ),
      );

      // Verify that SkeletonList is rendered when loading
      expect(find.byType(SkeletonList), findsOneWidget);
      expect(find.byType(PhotoList), findsNothing);
    });



  });
}

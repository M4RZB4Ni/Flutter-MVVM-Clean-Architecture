import 'dart:io';

import 'package:communere/app/di/main_binding.dart';
import 'package:communere/domain/entities/photo/photo.dart';
import 'package:communere/domain/usecase/photo/photo_usecase.dart';
import 'package:communere/presentation/home/home_view_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  late final HomeViewModel homeViewModel;

  setUpAll(() => {
        MainBinding().dependencies(),
        dotenv.testLoad(fileInput: File('test/assets/.env').readAsStringSync()),
        homeViewModel = HomeViewModel(Get.find<PhotoUseCase>()),
      });

  group('PhotosRepository', () {
    test('Test Initial state of Home page', () async {
      expect(homeViewModel.isLoading.value, true);
      expect(homeViewModel.photos.value, const Photos(photo: []));
      // Add more tests as needed for other scenarios...
    });

    test(
      'Test clearSearchBox function',
      () async {
        TestWidgetsFlutterBinding.ensureInitialized();

        homeViewModel.clearSearchBox();
        expect(homeViewModel.isLoading.value, true);
        expect(homeViewModel.searchController.text.isEmpty, true);
      },
    );
  });
}

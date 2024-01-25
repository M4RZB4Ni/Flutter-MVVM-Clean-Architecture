import 'package:communere/app/base/base_controller.dart';
import 'package:communere/domain/entities/search/search_criteria.dart';
import 'package:communere/domain/usecase/photo/photo_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../domain/entities/photo/photo.dart';

class HomeViewModel extends BaseController {
  final PhotoUseCase _photoUseCase;
  HomeViewModel(this._photoUseCase);

  final _searchController = TextEditingController();
  final _photos = const Photos(photo: []).obs;
  final _isLoading = true.obs;

  RxBool get isLoading => _isLoading;
  Rx<Photos> get photos => _photos;

  TextEditingController get searchController => _searchController;

  @override
  void onInit() async {
    super.onInit();
    await getRecentPhotos();
  }

  Future<void> getRecentPhotos() async {
    final result = await _photoUseCase.getRecentPhotos();
    result.when(
      success: (data) {
        _isLoading.value = false;
        _photos.value = data;
      },
      failure: (error) {
        _isLoading.value = true;
      },
    );
  }

  Future<void> searchPhotos(String searchCriteria) async {
    final result =
        await _photoUseCase.searchPhotos(SearchCriteria(text: searchCriteria));
    result.when(
      success: (data) {
        _isLoading.value = false;
        _photos.value = data;
      },
      failure: (error) {
        _isLoading.value = true;
      },
    );
  }

  void clearSearchBox() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_searchController.text.isNotEmpty && _isLoading.isFalse) {
      _isLoading.value = true;
      _searchController.clear();
      getRecentPhotos();
    }
  }

  void searchButtonHandler(String value) {
    _isLoading.value = true;
    if (value.isEmpty) {
      getRecentPhotos(); // Fetch recent photos if search criteria is empty
    } else {
      searchPhotos(value);
    }
  }
}

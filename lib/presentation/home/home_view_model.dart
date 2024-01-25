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
    await getImages();
  }

  Future<void> getImages() async {
    final result =
        await _photoUseCase.searchPhotos(const SearchCriteria(text: "red"));
    result.when(
      success: (data) {
        debugPrint("data fetched from getRecentPhotos $data");
      },
      failure: (error) {},
    );
  }

  Future<void> getRecentPhotos() async {
    final result =
    await _photoUseCase.getRecentPhotos();
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
}

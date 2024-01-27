// Import necessary packages and files.
import 'package:communere/app/base/base_controller.dart';
import 'package:communere/data/models/search/search_criteria.dart';
import 'package:communere/domain/usecase/photo/photo_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../domain/entities/photo/photo.dart';

// View model for the HomeScreen, extending BaseController.
class HomeViewModel extends BaseController {
  // Instance of the PhotoUseCase for handling photo-related operations.
  final PhotoUseCase _photoUseCase;

  // Constructor to initialize the view model with a PhotoUseCase.
  HomeViewModel(this._photoUseCase);

  // Controller for handling search functionality.
  final _searchController = TextEditingController();

  // Observable for storing the list of photos.
  final _photos = const Photos(photo: []).obs;

  // Observable for tracking the loading state.
  final _isLoading = true.obs;

  // Getter for accessing the loading state.
  RxBool get isLoading => _isLoading;

  // Getter for accessing the list of photos.
  Rx<Photos> get photos => _photos;

  // Getter for accessing the search controller.
  TextEditingController get searchController => _searchController;

  // Override the onInit method to perform initial operations when the view model is initialized.
  @override
  void onInit() async {
    super.onInit();
    await getRecentPhotos();
  }

  // Method to fetch recent photos using the PhotoUseCase.
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

  // Method to search for photos using the PhotoUseCase and a search criteria.
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

  // Method to clear the search box and fetch recent photos.
  void clearSearchBox() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_searchController.text.isNotEmpty) {
      _isLoading.value = true;
      _searchController.clear();
      getRecentPhotos();
    }
  }

  // Method to handle the search button press, triggering either recent photos fetch or search operation.
  void searchButtonHandler(String value) {
    _isLoading.value = true;
    if (value.isEmpty) {
      getRecentPhotos(); // Fetch recent photos if search criteria is empty.
    } else {
      searchPhotos(value);
    }
  }
}

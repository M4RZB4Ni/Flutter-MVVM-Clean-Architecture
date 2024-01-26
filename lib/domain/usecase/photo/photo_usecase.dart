import 'package:communere/app/base/api_result.dart';
import 'package:communere/domain/entities/photo/photo.dart';
import 'package:communere/domain/entities/search/search_criteria.dart';

// Import the repository interface.
import 'package:communere/domain/repository/photos_repository.dart';

// Abstract interface defining the contract for a use case to handle photo-related operations.
abstract interface class PhotoUseCase {
  // Method to fetch recent photos.
  Future<ApiResult<Photos>> getRecentPhotos();

  // Method to search for photos based on search criteria.
  Future<ApiResult<Photos>> searchPhotos(SearchCriteria searchCriteria);
}

// Class implementing the PhotoUseCase interface.
class PhotoUseCaseImpl extends PhotoUseCase {
  final PhotosRepository _repository;

  // Constructor for initializing the use case with a repository.
  PhotoUseCaseImpl(this._repository);

  @override
  Future<ApiResult<Photos>> getRecentPhotos() async {
    // Delegate the call to the repository to get recent photos.
    return await _repository.getRecentPhotos();
  }

  @override
  Future<ApiResult<Photos>> searchPhotos(SearchCriteria searchCriteria) async {
    // Delegate the call to the repository to search for photos.
    return await _repository.searchPhotos(searchCriteria: searchCriteria);
  }
}

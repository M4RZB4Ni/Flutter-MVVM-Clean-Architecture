// Import necessary files and packages for the PhotosDataSource.
import 'package:communere/domain/entities/photo/photo.dart';

// Import the API result class and the search criteria entity.
import '../../app/base/api_result.dart';
import '../entities/search/search_criteria.dart';

// Abstract class defining the contract for a data source to fetch photos.
abstract class PhotosDataSource {
  // Method to fetch recent photos.
  Future<ApiResult<Photos>> getRecentPhotos();

  // Method to search for photos based on search criteria.
  Future<ApiResult<Photos>> searchPhotos(
      {required SearchCriteria searchCriteria});
}

import 'package:communere/domain/entities/search/search_criteria.dart';

// Import the API result class and the Photo entity.
import '../../app/base/api_result.dart';
import '../entities/photo/photo.dart';

// Abstract class defining the contract for a repository to handle photo-related operations.
abstract class PhotosRepository {
  // Method to fetch recent photos.
  Future<ApiResult<Photos>> getRecentPhotos();

  // Method to search for photos based on search criteria.
  Future<ApiResult<Photos>> searchPhotos(
      {required SearchCriteria searchCriteria});
}

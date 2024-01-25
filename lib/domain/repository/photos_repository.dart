import 'package:communere/domain/entities/search/search_criteria.dart';

import '../../app/base/api_result.dart';
import '../entities/photo/photo.dart';

abstract class PhotosRepository{
  Future<ApiResult<List<Photo>>> getRecentPhotos();
  Future<ApiResult<List<Photo>>> searchPhotos({required SearchCriteria searchCriteria});
}
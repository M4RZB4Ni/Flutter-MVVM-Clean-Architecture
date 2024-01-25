import 'package:communere/domain/entities/search/search_criteria.dart';

import '../../app/base/api_result.dart';
import '../entities/photo/photo.dart';

abstract class PhotosRepository{
  Future<ApiResult<Photos>> getRecentPhotos();
  Future<ApiResult<Photos>> searchPhotos({required SearchCriteria searchCriteria});
}
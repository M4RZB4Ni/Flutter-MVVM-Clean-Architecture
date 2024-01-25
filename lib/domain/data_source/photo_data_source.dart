import 'package:communere/domain/entities/photo/photo.dart';

import '../../app/base/api_result.dart';
import '../entities/search/search_criteria.dart';

abstract class PhotosDataSource{

  Future<ApiResult<List<Photo>>> getRecentPhotos();
  Future<ApiResult<List<Photo>>> searchPhotos({required SearchCriteria searchCriteria});

}
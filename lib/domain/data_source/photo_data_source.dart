import 'package:communere/domain/entities/photo/photo.dart';

import '../../app/base/api_result.dart';
import '../entities/search/search_criteria.dart';

abstract class PhotosDataSource{

  Future<ApiResult<Photos>> getRecentPhotos();
  Future<ApiResult<Photos>> searchPhotos({required SearchCriteria searchCriteria});

}
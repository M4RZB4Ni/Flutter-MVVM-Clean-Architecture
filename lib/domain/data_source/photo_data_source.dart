import '../../app/base/api_result.dart';

abstract  class PhotosDataSource{

  Future<ApiResult<String>> getRecentPhotos();
  Future<ApiResult<String>> searchPhotos();

}
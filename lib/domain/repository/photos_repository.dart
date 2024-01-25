import '../../app/base/api_result.dart';

abstract class PhotosRepository{
  Future<ApiResult<String>> getRecentPhotos();
  Future<ApiResult<String>> searchPhotos();
}
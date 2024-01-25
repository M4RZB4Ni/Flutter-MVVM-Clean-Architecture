import 'package:communere/app/base/api_result.dart';

abstract interface class PhotosService{

  Future<ApiResult<String>> getRecentPhotos();
  Future<ApiResult<String>> searchPhotos();

}
import 'package:communere/app/base/api_result.dart';
import 'package:communere/domain/data_source/photo_data_source.dart';

class PhotosRemoteDataSource extends PhotosDataSource{
  @override
  Future<ApiResult<String>> getRecentPhotos() {
    // TODO: implement getRecentPhotos
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<String>> searchPhotos() {
    // TODO: implement searchPhotos
    throw UnimplementedError();
  }



}
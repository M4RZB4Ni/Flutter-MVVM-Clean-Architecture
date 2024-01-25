import 'package:communere/app/base/api_result.dart';

import '../../domain/repository/photos_repository.dart';

class PhotoRepositoryImpl extends PhotosRepository{
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
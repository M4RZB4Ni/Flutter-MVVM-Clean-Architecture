import 'package:communere/app/base/api_result.dart';
import 'package:communere/domain/data_source/photo_data_source.dart';
import 'package:communere/domain/entities/photo/photo.dart';
import 'package:communere/domain/entities/search/search_criteria.dart';

class PhotosRemoteDataSource extends PhotosDataSource{
  @override
  Future<ApiResult<List<Photo>>> getRecentPhotos() {
    // TODO: implement getRecentPhotos
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<List<Photo>>> searchPhotos({required SearchCriteria searchCriteria}) {
    // TODO: implement searchPhotos
    throw UnimplementedError();
  }






}
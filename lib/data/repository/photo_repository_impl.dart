import 'package:communere/app/base/api_result.dart';
import 'package:communere/domain/data_source/photo_data_source.dart';
import 'package:communere/domain/entities/photo/photo.dart';
import 'package:communere/domain/entities/search/search_criteria.dart';

import '../../domain/repository/photos_repository.dart';

class PhotosRepositoryImpl extends PhotosRepository {
  final PhotosDataSource _dataSource;

  PhotosRepositoryImpl(this._dataSource);


  @override
  Future<ApiResult<Photos>> getRecentPhotos() async {
    return await _dataSource.getRecentPhotos();
  }

  @override
  Future<ApiResult<Photos>> searchPhotos({required SearchCriteria searchCriteria}) async {
    return await _dataSource.searchPhotos(searchCriteria: searchCriteria);
  }
}

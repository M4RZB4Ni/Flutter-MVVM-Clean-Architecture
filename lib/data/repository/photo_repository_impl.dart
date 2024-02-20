// Class implementing the PhotosRepository interface.
import 'package:communere/app/base/api_result.dart';
import 'package:communere/data/models/search/search_criteria.dart';
import 'package:communere/domain/data_source/photo_data_source.dart';
import 'package:communere/domain/entities/photo/photo.dart';
import 'package:communere/domain/repository/photos_repository.dart';

class PhotosRepositoryImpl extends PhotosRepository {
  final PhotosDataSource _dataSource;

  // Constructor for initializing the repository with a data source.
  PhotosRepositoryImpl(this._dataSource);



  @override
  Future<ApiResult<Photos>> searchPhotos(
      {required SearchCriteria searchCriteria}) async {
    // Delegate the call to the data source to search for photos.
    return await _dataSource.searchPhotos(searchCriteria: searchCriteria);
  }

  @override
  Future<ApiResult<Photos>> getRecentPhotos() async {
    // Delegate the call to the data source to get recent photos.
    return await _dataSource.getRecentPhotos();
  }
}

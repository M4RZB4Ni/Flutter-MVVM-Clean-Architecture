import 'package:communere/app/base/api_result.dart';
import 'package:communere/domain/data_source/photo_data_source.dart';
import 'package:communere/domain/entities/photo/photo.dart';
import 'package:communere/domain/entities/search/search_criteria.dart';

import '../../domain/repository/photos_repository.dart';

class PhotoRepositoryImpl extends PhotosRepository {
  final PhotosDataSource dataSource;

  PhotoRepositoryImpl({required this.dataSource});

  @override
  Future<ApiResult<Photos>> getRecentPhotos() async {
    final result = await dataSource.getRecentPhotos();
    return result.when(
      success: (data) => ApiResult.success(data: data),
      failure: (error) => ApiResult.failure(error: error),
    );
  }

  @override
  Future<ApiResult<Photos>> searchPhotos(
      {required SearchCriteria searchCriteria}) async {
      final result =
          await dataSource.searchPhotos(searchCriteria: searchCriteria);
      return result.when(
        success: (data) => ApiResult.success(data: data),
        failure: (error) => ApiResult.failure(error: error),
      );
  }
}

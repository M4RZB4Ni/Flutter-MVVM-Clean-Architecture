import 'package:communere/app/base/api_result.dart';
import 'package:communere/domain/entities/photo/photo.dart';
import 'package:communere/domain/entities/search/search_criteria.dart';
import 'package:communere/domain/repository/photos_repository.dart';

abstract interface class PhotoUseCase {
  Future<ApiResult<Photos>> getRecentPhotos();
  Future<ApiResult<Photos>> searchPhotos(SearchCriteria searchCriteria);
}

class PhotoUseCaseImpl extends PhotoUseCase {
  final PhotosRepository _repository;

  PhotoUseCaseImpl(this._repository);

  @override
  Future<ApiResult<Photos>> getRecentPhotos() async {
    return await _repository.getRecentPhotos();
  }

  @override
  Future<ApiResult<Photos>> searchPhotos(SearchCriteria searchCriteria) async {
    return await _repository.searchPhotos(searchCriteria: searchCriteria);
  }
}

import 'package:communere/app/base/api_result.dart';
import 'package:communere/data/data_source/remote/photos_remote_data_source.dart';
import 'package:communere/domain/entities/photo/photo.dart';
import 'package:communere/domain/entities/search/search_criteria.dart';

import '../../domain/repository/photos_repository.dart';

class PhotoRepositoryImpl extends PhotosRepository{

  final PhotosRemoteDataSource remoteDataSource;

  PhotoRepositoryImpl({required this.remoteDataSource});

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
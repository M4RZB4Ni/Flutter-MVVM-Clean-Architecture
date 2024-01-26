import 'package:communere/app/base/api_result.dart';
import 'package:communere/app/network/exception_handler.dart';
import 'package:communere/app/network/network_client.dart';
import 'package:communere/app/network/network_enums.dart';
import 'package:communere/data/models/photo/photo_dto.dart';
import 'package:communere/domain/data_source/photo_data_source.dart';
import 'package:communere/domain/entities/photo/photo.dart';
import 'package:communere/domain/entities/search/search_criteria.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Implementation of the PhotosDataSource as Remote data source
class PhotosRemoteDataSource extends PhotosDataSource {
  final NetworkClient _networkClient;

  PhotosRemoteDataSource(this._networkClient);

  @override
  Future<ApiResult<Photos>> getRecentPhotos() async {
    try {
      final response = await _networkClient.sendRequest(
          "${dotenv.env['SERVER']}?method=flickr.photos.getRecent&api_key=${dotenv.env['API_KEY']}",
          requestType: HttpRequestType.GET);

      if (response.status) {
        debugPrint('result ${response.result}');
        final photoResultDto = PhotoResultDto.fromJson(response.result);
        return ApiResult.success(data: Photos.fromDto(photoResultDto.photos));
      }

      return ApiResult.failure(
          error: ExceptionHandler.handleResponse(response.statusCode));
    } on ExceptionHandler catch (e) {
      return ApiResult.failure(error: e);
    }
  }

  @override
  Future<ApiResult<Photos>> searchPhotos(
      {required SearchCriteria searchCriteria}) async {
    final response = await _networkClient.sendRequest(
        "${dotenv.env['SERVER']}?method=flickr.photos.search&api_key=${dotenv.env['API_KEY']}&text=${searchCriteria.text}",
        requestType: HttpRequestType.GET);
    if (response.status) {
      final photoResultDto = PhotoResultDto.fromJson(response.result);
      return ApiResult.success(data: Photos.fromDto(photoResultDto.photos));
    }
    return ApiResult.failure(
        error: ExceptionHandler.handleResponse(response.statusCode));
  }
}

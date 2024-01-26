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

  // Constructor for initializing the remote data source with a network client.
  PhotosRemoteDataSource(this._networkClient);

  @override
  Future<ApiResult<Photos>> getRecentPhotos() async {
    try {
      // Send a network request to get recent photos using the Flickr API.
      final response = await _networkClient.sendRequest(
          "${dotenv.env['SERVER']}?method=flickr.photos.getRecent&api_key=${dotenv.env['API_KEY']}",
          requestType: HttpRequestType.GET);

      // Check if the response status indicates success.
      if (response.status) {
        // Print debug information about the result.
        debugPrint('result ${response.result}');

        // Deserialize the response result into a PhotoResultDto.
        final photoResultDto = PhotoResultDto.fromJson(response.result);

        // Return a successful API result with the converted Photos entity.
        return ApiResult.success(data: Photos.fromDto(photoResultDto.photos));
      }

      // Return a failed API result with the appropriate exception.
      return ApiResult.failure(
          error: ExceptionHandler.handleResponse(response.statusCode));
    } on ExceptionHandler catch (e) {
      // Return a failed API result with the caught exception.
      return ApiResult.failure(error: e);
    }
  }

  @override
  Future<ApiResult<Photos>> searchPhotos(
      {required SearchCriteria searchCriteria}) async {
    // Send a network request to search for photos using the Flickr API based on search criteria.
    final response = await _networkClient.sendRequest(
        "${dotenv.env['SERVER']}?method=flickr.photos.search&api_key=${dotenv.env['API_KEY']}&text=${searchCriteria.text}",
        requestType: HttpRequestType.GET);

    // Check if the response status indicates success.
    if (response.status) {
      // Deserialize the response result into a PhotoResultDto.
      final photoResultDto = PhotoResultDto.fromJson(response.result);

      // Return a successful API result with the converted Photos entity.
      return ApiResult.success(data: Photos.fromDto(photoResultDto.photos));
    }

    // Return a failed API result with the appropriate exception.
    return ApiResult.failure(
        error: ExceptionHandler.handleResponse(response.statusCode));
  }
}

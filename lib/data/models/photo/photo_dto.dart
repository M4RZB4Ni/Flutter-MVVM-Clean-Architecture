import 'package:freezed_annotation/freezed_annotation.dart';

// Generate part files using Freezed package.
part 'photo_dto.freezed.dart';
part 'photo_dto.g.dart';

// Freezed annotations to create immutable data classes for DTOs.
@freezed
class PhotoResultDto with _$PhotoResultDto {
  // Factory constructor for a PhotoResultDto.
  factory PhotoResultDto({
    required final PhotosDto
        photos, // PhotosDto object containing a list of PhotoDto.
  }) = _PhotoResultDto;

  // Factory method to deserialize a JSON map into a PhotoResultDto object.
  factory PhotoResultDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoResultDtoFromJson(json);
}

@freezed
class PhotosDto with _$PhotosDto {
  // Immutable data class for a list of PhotoDto.
  const factory PhotosDto({
    @Default(<PhotoDto>[]) List<PhotoDto> photo, // List of PhotoDto objects.
  }) = _PhotosDto;

  // Factory method to deserialize a JSON map into a PhotosDto object.
  factory PhotosDto.fromJson(Map<String, dynamic> json) =>
      _$PhotosDtoFromJson(json);
}

@freezed
class PhotoDto with _$PhotoDto {
  // Immutable data class for individual photo details.
  const factory PhotoDto({
    required String id,
    required String owner,
    required String secret,
    required String server,
    required String farm,
    required String title,
    required String ispublic,
    required String isfriend,
    required String isfamily,
  }) = _PhotoDto;

  // Factory method to deserialize a JSON map into a PhotoDto object.
  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);
}

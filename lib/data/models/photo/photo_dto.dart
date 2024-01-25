import 'package:freezed_annotation/freezed_annotation.dart';


part 'photo_dto.freezed.dart';
part 'photo_dto.g.dart';


@freezed
class PhotoResultDto with _$PhotoResultDto {
  factory PhotoResultDto({
    required final PhotosDto photos,
  }) = _PhotoResultDto;

  factory PhotoResultDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoResultDtoFromJson(json);

}

@freezed
class PhotosDto with _$PhotosDto {
  const factory PhotosDto({
    required List<PhotoDto> photo,
  }) = _PhotosDto;

  factory PhotosDto.fromJson(Map<String, dynamic> json) =>
      _$PhotosDtoFromJson(json);
}


@freezed
class PhotoDto with _$PhotoDto {
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

  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);
}
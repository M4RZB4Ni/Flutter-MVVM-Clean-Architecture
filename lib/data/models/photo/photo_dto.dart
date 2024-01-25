import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_dto.freezed.dart';
part 'photo_dto.g.dart';


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
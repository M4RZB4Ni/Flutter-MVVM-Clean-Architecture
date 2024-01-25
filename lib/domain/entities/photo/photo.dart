import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/photo/photo_dto.dart';


part 'photo.freezed.dart';
part 'photo.g.dart';



@freezed
class Photos with _$Photos {
  const factory Photos({
    required final List<Photo> photo,
  }) = _Photos;

  factory Photos.fromJson(Map<String, dynamic> json) =>
      _$PhotosFromJson(json);

  factory Photos.fromDto(PhotosDto photosDto) {
    return Photos(
      photo: photosDto.photo.map((photoDto) => Photo.fromDto(photoDto)).toList(),
    );
  }
}

@freezed
class Photo with _$Photo {
  const factory Photo({
    required String id,
    required String secret,
    required String server,
    required String title,

  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) =>
      _$PhotoFromJson(json);

  factory Photo.fromDto(PhotoDto photoDto) {
    return Photo(
      id: photoDto.id,
      secret: photoDto.secret,
      server: photoDto.server,
      title: photoDto.title,
    );
  }
}
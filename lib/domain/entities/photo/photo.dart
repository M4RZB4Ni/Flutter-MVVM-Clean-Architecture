// Import necessary packages and files for Freezed annotations.
import 'package:freezed_annotation/freezed_annotation.dart';

// Import the DTO model for photo details.
import '../../../data/models/photo/photo_dto.dart';

// Generate part files using Freezed package.
part 'photo.freezed.dart';
part 'photo.g.dart';

// Freezed annotations to create immutable data classes for Photos and Photo.
@freezed
class Photos with _$Photos {
  // Factory constructor for Photos data class.
  const factory Photos({
    required final List<Photo> photo, // List of Photo objects.
  }) = _Photos;

  // Factory method to deserialize a JSON map into a Photos object.
  factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);

  // Factory method to convert a PhotosDto object into a Photos object.
  factory Photos.fromDto(PhotosDto photosDto) {
    return Photos(
      photo:
          photosDto.photo.map((photoDto) => Photo.fromDto(photoDto)).toList(),
    );
  }
}

@freezed
class Photo with _$Photo {
  // Factory constructor for Photo data class.
  const factory Photo({
    required String id,
    required String secret,
    required String server,
    required String title,
  }) = _Photo;

  // Factory method to deserialize a JSON map into a Photo object.
  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  // Factory method to convert a PhotoDto object into a Photo object.
  factory Photo.fromDto(PhotoDto photoDto) {
    return Photo(
      id: photoDto.id,
      secret: photoDto.secret,
      server: photoDto.server,
      title: photoDto.title,
    );
  }
}

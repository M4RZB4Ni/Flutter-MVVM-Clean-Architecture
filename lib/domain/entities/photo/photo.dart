import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

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
}
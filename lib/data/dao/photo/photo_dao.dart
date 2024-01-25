import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_dao.freezed.dart';
part 'photo_dao.g.dart';


@freezed
class PhotoDao with _$PhotoDao {
  const factory PhotoDao({
    required String id,
    required String owner,
    required String secret,
    required String server,
    required String farm,
    required String title,
    required String ispublic,
    required String isfriend,
    required String isfamily,
  }) = _PhotoDao;

  factory PhotoDao.fromJson(Map<String, dynamic> json) =>
      _$PhotoDaoFromJson(json);
}
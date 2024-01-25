import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_criteria.freezed.dart';
part 'search_criteria.g.dart';


@freezed
class SearchCriteria with _$SearchCriteria {
  const factory SearchCriteria ({
    required String method,
    required String text,
  }) = _SearchCriteria;

  factory SearchCriteria.fromJson(Map<String, dynamic> json) =>
      _$SearchCriteriaFromJson(json);
}
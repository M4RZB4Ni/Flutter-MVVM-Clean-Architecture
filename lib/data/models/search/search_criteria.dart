// Import necessary packages and files for Freezed annotations.
import 'package:freezed_annotation/freezed_annotation.dart';

// Generate part files using Freezed package.
part 'search_criteria.freezed.dart';
part 'search_criteria.g.dart';

// Freezed annotations to create an immutable data class for SearchCriteria.
@freezed
class SearchCriteria with _$SearchCriteria {
  // Factory constructor for SearchCriteria data class.
  const factory SearchCriteria({
    required String text, // Required text for search criteria.
  }) = _SearchCriteria;

  // Factory method to deserialize a JSON map into a SearchCriteria object.
  factory SearchCriteria.fromJson(Map<String, dynamic> json) =>
      _$SearchCriteriaFromJson(json);
}

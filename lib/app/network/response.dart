import 'package:freezed_annotation/freezed_annotation.dart';

// Generate a part file using Freezed package.
part 'response.freezed.dart';
part 'response.g.dart';

// Freezed annotation to create a union type for API responses.
@freezed
class Response with _$Response {
  // Factory constructor for a response object.
  const factory Response({
    required bool status, // Indicates the success or failure of the response.
    required dynamic result, // Holds the result data of the response.
    required int statusCode, // Represents the HTTP status code of the response.
  }) = _Response;

  // Factory method to deserialize a JSON map into a Response object.
  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
}

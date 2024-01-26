import 'package:communere/app/network/exception_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_state.freezed.dart';

@freezed
class ResultState<T> with _$ResultState<T> {
  const factory ResultState.idle() = Idle<T>;

  const factory ResultState.loading() = Loading<T>;

  const factory ResultState.lostConnection({final T? widget}) =
      LostConnection<T>;

  const factory ResultState.data({required final T data}) = Data<T>;

  const factory ResultState.error({required ExceptionHandler error}) = Error<T>;
}

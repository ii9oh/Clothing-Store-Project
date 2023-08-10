import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_project/common/network/network_exceptions.dart';

part 'result_api.freezed.dart';

@freezed
class ResultApi<T> with _$ResultApi<T> {
  factory ResultApi.success({required T response}) = Success<T>;
  factory ResultApi.failure({required NetworkExceptions error}) = Failure<T>;
}

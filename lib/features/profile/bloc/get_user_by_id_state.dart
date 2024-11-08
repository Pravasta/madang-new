part of 'get_user_by_id_bloc.dart';

@freezed
class GetUserByIdState with _$GetUserByIdState {
  const factory GetUserByIdState.initial() = _Initial;
  const factory GetUserByIdState.loading() = _Loading;
  const factory GetUserByIdState.error(String error) = _Error;
  const factory GetUserByIdState.loaded(User user) = _Loaded;
}

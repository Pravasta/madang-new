part of 'get_all_menu_bloc.dart';

@freezed
class GetAllMenuState with _$GetAllMenuState {
  const factory GetAllMenuState.initial() = _Initial;
  const factory GetAllMenuState.loading() = _Loading;
  const factory GetAllMenuState.error(String error) = _Error;
  const factory GetAllMenuState.loaded(List<Menu> data) = _Loaded;
}

part of 'get_all_menu_bloc.dart';

@freezed
class GetAllMenuEvent with _$GetAllMenuEvent {
  const factory GetAllMenuEvent.started() = _Started;
  const factory GetAllMenuEvent.getAllMenu() = _GetAllMenu;
}

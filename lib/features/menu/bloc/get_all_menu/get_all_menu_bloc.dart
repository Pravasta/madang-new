import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:madang_app/data/model/response/menu_response_model.dart';
import 'package:madang_app/features/menu/repository/menu_repository.dart';

part 'get_all_menu_event.dart';
part 'get_all_menu_state.dart';
part 'get_all_menu_bloc.freezed.dart';

class GetAllMenuBloc extends Bloc<GetAllMenuEvent, GetAllMenuState> {
  final MenuRepository _repository;

  GetAllMenuBloc(this._repository) : super(const _Initial()) {
    on<_GetAllMenu>((event, emit) async {
      emit(const _Loading());

      final result = await _repository.getAllMenu();

      result.fold(
        (l) => emit(_Error(l.message)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}

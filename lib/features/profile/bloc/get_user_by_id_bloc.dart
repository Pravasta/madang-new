import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:madang_app/data/model/response/user_response_model.dart';
import 'package:madang_app/features/profile/repository/profile_repository.dart';

part 'get_user_by_id_event.dart';
part 'get_user_by_id_state.dart';
part 'get_user_by_id_bloc.freezed.dart';

class GetUserByIdBloc extends Bloc<GetUserByIdEvent, GetUserByIdState> {
  final ProfileRepository _profileRepository;

  GetUserByIdBloc(this._profileRepository) : super(const _Initial()) {
    on<_GetUserById>((event, emit) async {
      emit(const _Loading());

      final result = await _profileRepository.getUserById();

      result.fold(
        (l) => emit(_Error(l.message)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}

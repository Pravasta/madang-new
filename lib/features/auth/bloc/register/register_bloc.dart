import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:madang_app/data/model/request/register_request_model.dart';
import 'package:madang_app/data/model/response/register_response_model.dart';
import 'package:madang_app/features/auth/repository/auth_repository.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository _repository;

  RegisterBloc(this._repository) : super(const _Initial()) {
    on<_Register>((event, emit) async {
      emit(const _Loading());

      final result = await _repository.register(event.registerRequest);

      result.fold(
        (l) => emit(_Error(l.message)),
        (r) => emit(_Success(r)),
      );
    });
  }
}

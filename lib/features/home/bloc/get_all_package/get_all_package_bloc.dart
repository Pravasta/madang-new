import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:madang_app/data/model/response/package_response_model.dart';
import 'package:madang_app/features/home/repository/home_repository.dart';

part 'get_all_package_event.dart';
part 'get_all_package_state.dart';
part 'get_all_package_bloc.freezed.dart';

class GetAllPackageBloc extends Bloc<GetAllPackageEvent, GetAllPackageState> {
  final HomeRepository _repository;

  GetAllPackageBloc(this._repository) : super(const _Initial()) {
    on<_GetAllPackage>((event, emit) async {
      emit(const _Loading());

      final result = await _repository.getAllPackage();

      result.fold(
        (l) => emit(_Error(l.message)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}

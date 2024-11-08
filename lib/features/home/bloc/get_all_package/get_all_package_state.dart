part of 'get_all_package_bloc.dart';

@freezed
class GetAllPackageState with _$GetAllPackageState {
  const factory GetAllPackageState.initial() = _Initial;
  const factory GetAllPackageState.loading() = _Loading;
  const factory GetAllPackageState.error(String error) = _Error;
  const factory GetAllPackageState.loaded(List<Package> data) = _Loaded;
}

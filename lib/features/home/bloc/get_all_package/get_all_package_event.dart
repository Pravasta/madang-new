part of 'get_all_package_bloc.dart';

@freezed
class GetAllPackageEvent with _$GetAllPackageEvent {
  const factory GetAllPackageEvent.started() = _Started;
  const factory GetAllPackageEvent.getAllPackage() = _GetAllPackage;
}

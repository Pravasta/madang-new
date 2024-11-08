import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:madang_app/core/exception/failure.dart';
import 'package:madang_app/data/datasources/package_datasource/package_remote_datasources.dart';
import 'package:madang_app/data/model/response/package_response_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Package>>> getAllPackage();
}

class HomeRepositoryImpl implements HomeRepository {
  final PackageRemoteDatasources _remoteDatasources;

  HomeRepositoryImpl({
    required PackageRemoteDatasources remoteDatasources,
  }) : _remoteDatasources = remoteDatasources;

  @override
  Future<Either<Failure, List<Package>>> getAllPackage() async {
    try {
      final execute = await _remoteDatasources.getAllPackage();
      return Right(execute.data ?? []);
    } on SocketException {
      return Left(ConnectionFailure());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  factory HomeRepositoryImpl.create() {
    return HomeRepositoryImpl(
      remoteDatasources: PackageRemoteDatasourcesImpl.create(),
    );
  }
}

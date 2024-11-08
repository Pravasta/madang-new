import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:madang_app/core/exception/failure.dart';
import 'package:madang_app/data/datasources/user_datasource/user_remote_datasource.dart';
import 'package:madang_app/data/model/response/user_response_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, User>> getUserById();
}

class ProfileRepositoryImpl implements ProfileRepository {
  final UserRemoteDatasource _datasource;

  ProfileRepositoryImpl({
    required UserRemoteDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<Either<Failure, User>> getUserById() async {
    try {
      final execute = await _datasource.getUser();
      return Right(execute.user!);
    } on SocketException {
      return Left(ConnectionFailure());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  factory ProfileRepositoryImpl.create() {
    return ProfileRepositoryImpl(
      datasource: UserRemoteDatasourceImpl.create(),
    );
  }
}

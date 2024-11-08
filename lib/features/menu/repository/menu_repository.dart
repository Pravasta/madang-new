import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:madang_app/core/exception/failure.dart';
import 'package:madang_app/data/datasources/menu_datasource/menu_remote_datasources.dart';
import 'package:madang_app/data/model/response/menu_response_model.dart';

abstract class MenuRepository {
  Future<Either<Failure, List<Menu>>> getAllMenu();
}

class MenuRepositoryImpl implements MenuRepository {
  final MenuRemoteDatasources _remoteDatasources;

  MenuRepositoryImpl({required MenuRemoteDatasources remoteDatasources})
      : _remoteDatasources = remoteDatasources;

  @override
  Future<Either<Failure, List<Menu>>> getAllMenu() async {
    try {
      final execute = await _remoteDatasources.getAllMenu();
      return Right(execute.data ?? []);
    } on SocketException {
      return Left(ConnectionFailure());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  factory MenuRepositoryImpl.create() {
    return MenuRepositoryImpl(
      remoteDatasources: MenuRemoteDatasourcesImpl.create(),
    );
  }
}

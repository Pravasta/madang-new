import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:madang_app/data/datasources/auth_datasource/auth_local_datasources.dart';
import 'package:madang_app/data/datasources/auth_datasource/auth_remote_datasources.dart';
import 'package:madang_app/data/model/request/login_request_model.dart';
import 'package:madang_app/data/model/request/register_request_model.dart';
import 'package:madang_app/data/model/response/login_response_model.dart';
import 'package:madang_app/data/model/response/register_response_model.dart';

import '../../../core/exception/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponseModel>> login(LoginRequestModel data);
  Future<Either<Failure, RegisterResponseModel>> register(
      RegisterRequestModel data);
  Future<Either<Failure, void>> logout();
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemotDatasources _remotDatasources;
  final AuthLocalDatasource _authLocalDatasource;

  AuthRepositoryImpl(
      {required AuthRemotDatasources remotDatasources,
      required AuthLocalDatasource authLocalDatasource})
      : _remotDatasources = remotDatasources,
        _authLocalDatasource = authLocalDatasource;

  @override
  Future<Either<Failure, LoginResponseModel>> login(
      LoginRequestModel data) async {
    try {
      final execute = await _remotDatasources.login(data);
      return Right(execute);
    } on SocketException {
      return Left(ConnectionFailure());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RegisterResponseModel>> register(
      RegisterRequestModel data) async {
    try {
      final execute = await _remotDatasources.register(data);
      return Right(execute);
    } on SocketException {
      return Left(ConnectionFailure());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _authLocalDatasource.removeAuthData();
      return const Right(null);
    } on SocketException {
      return Left(ConnectionFailure());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  factory AuthRepositoryImpl.create() {
    return AuthRepositoryImpl(
        remotDatasources: AuthRemoteDatasourcesImpl.create(),
        authLocalDatasource: AuthLocalDatasourceImpl());
  }
}

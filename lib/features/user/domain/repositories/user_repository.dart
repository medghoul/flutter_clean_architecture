import 'package:dartz/dartz.dart';
import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/core/params/params.dart';
import 'package:clean_architecture/features/user/domain/entities/user_entitiy.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUser({required UserParams params});
  Future<Either<Failure, void>> deleteUser({required UserParams params});
} 

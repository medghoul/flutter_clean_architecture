import 'package:dartz/dartz.dart';
import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/core/params/params.dart';
import 'package:clean_architecture/features/user/domain/repositories/user_repository.dart';

class DeleteUser {
  final UserRepository repository;

  DeleteUser(this.repository);

  Future<Either<Failure, void>> call({required UserParams params}) async {
    return await repository.deleteUser(params: params);
  }
}

import '../../core/error/failures.dart';
import '../../core/utils/either.dart';
import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getUsers();
  Future<Either<Failure, UserEntity>> getUserById(int id);
  Future<Either<Failure, UserEntity>> createUser({required String name, required String email, String? avatar});
  Future<Either<Failure, UserEntity>> updateUser({required int id, String? name, String? email, String? avatar});
  Future<Either<Failure, void>> deleteUser(int id);
}

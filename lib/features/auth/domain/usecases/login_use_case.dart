import 'package:injectable/injectable.dart';
import '../../data/models/user_model.dart';
import '../../domain/repositories/auth_repository.dart';

@injectable
class LoginUseCase {
  final AuthRepository _repo;
  LoginUseCase(this._repo);

  Future<UserModel> call(String email, String password) {
    return _repo.login(email: email, password: password);
  }
}

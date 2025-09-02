import 'package:injectable/injectable.dart';
import '../../data/models/user_model.dart';
import '../../domain/repositories/auth_repository.dart';

@injectable
class RegisterUseCase {
  final AuthRepository _repo;
  RegisterUseCase(this._repo);

  Future<UserModel> call(String email, String password, {String? name}) {
    return _repo.register(email: email, password: password, name: name);
  }
}

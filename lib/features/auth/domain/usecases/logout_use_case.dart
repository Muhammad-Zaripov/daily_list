import 'package:injectable/injectable.dart';
import '../../domain/repositories/auth_repository.dart';

@injectable
class LogoutUseCase {
  final AuthRepository _repo;
  LogoutUseCase(this._repo);

  Future<void> call() {
    return _repo.logout();
  }
}

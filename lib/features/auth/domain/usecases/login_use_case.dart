import 'package:daily_list/core/usecase/use_case.dart';
import 'package:daily_list/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase implements UseCase<UserCredential, LoginUseCaseParams> {
  final AuthRepository _authRepository;
  LoginUseCase(this._authRepository);
  @override
  Future<UserCredential> call(LoginUseCaseParams params) async {
    return _authRepository.login(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginUseCaseParams {
  final String email;
  final String password;

  LoginUseCaseParams({required this.email, required this.password});
}

import 'package:daily_list/core/usecase/use_case.dart';
import 'package:daily_list/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase
    implements UseCase<UserCredential, RegisterUseCaseParams> {
  final AuthRepository _authRepository;
  RegisterUseCase(this._authRepository);
  @override
  Future<UserCredential> call(RegisterUseCaseParams params) async {
    return _authRepository.register(
      email: params.email,
      password: params.password,
      name: params.name,
    );
  }
}

class RegisterUseCaseParams {
  final String email;
  final String password;
  final String name;
  RegisterUseCaseParams({
    required this.name,
    required this.email,
    required this.password,
  });
}

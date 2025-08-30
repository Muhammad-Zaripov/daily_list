import 'package:daily_list/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    final request = FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return request;
  }

  @override
  Future<UserCredential> register({
    required String email,
    required String password,
    required String name,
  }) async {
    final request = FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    FirebaseAuth.instance.currentUser?.updateDisplayName(name);
    return request;
  }
}

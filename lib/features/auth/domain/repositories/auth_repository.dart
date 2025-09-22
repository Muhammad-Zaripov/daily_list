import '../../data/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> login({required String email, required String password});

  Future<UserModel> register({
    required String email,
    required String password,
    String? name,
  });
  // Future<UserModel> updateUser({
  //   required String uid,
  //   required String email,
  //   required String name,
  // });

  Future<void> logout();
}

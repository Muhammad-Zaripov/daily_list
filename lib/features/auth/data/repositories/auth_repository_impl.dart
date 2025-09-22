import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = credential.user!;
    final snapshot = await _firestore.collection('users').doc(user.uid).get();

    if (snapshot.exists) {
      return UserModel.fromJson(snapshot.data()!);
    } else {
      final userModel = UserModel.fromFirebase(user);
      await _firestore
          .collection('users')
          .doc(user.uid)
          .set(userModel.toJson());
      return userModel;
    }
  }

  @override
  Future<UserModel> register({
    required String email,
    required String password,
    String? name,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = credential.user!;
    await user.updateDisplayName(name ?? "user");
    final userModel = UserModel(
      uid: user.uid,
      email: user.email ?? '',
      name: name ?? "user",
    );
    await _firestore.collection('users').doc(user.uid).set(userModel.toJson());
    return userModel;
  }

  // @override
  // Future<UserModel> updateUser({
  //   required String uid,
  //   required String name,
  //   required String email,
  // }) async {
  //   await _firestore.collection('users').doc(uid).update({
  //     'name': name,
  //     'email': email,
  //   });

  //   final user = _auth.currentUser;
  //   if (user != null) {
  //     await user.verifyBeforeUpdateEmail(email);
  //     await user.updateDisplayName(name);
  //   }

  //   final snapshot = await _firestore.collection('users').doc(uid).get();
  //   return UserModel.fromJson(snapshot.data()!);
  // }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }
}

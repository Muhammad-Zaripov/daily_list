import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../domain/usecases/login_use_case.dart';
import '../../domain/usecases/register_use_case.dart';
import '../../domain/usecases/logout_use_case.dart';
import '../../data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthBloc(this._loginUseCase, this._registerUseCase, this._logoutUseCase)
    : super(const AuthState.initial()) {
    on<AuthEvent>(_onEvent);
  }

  Future<void> _onEvent(AuthEvent event, Emitter<AuthState> emit) async {
    await event.map(
      login: (e) async {
        emit(const AuthState.loading());
        try {
          final user = await _loginUseCase(e.email, e.password);
          emit(AuthState.authenticated(user));
        } catch (err) {
          emit(AuthState.error(err.toString()));
        }
      },
      register: (e) async {
        emit(const AuthState.loading());
        try {
          final user = await _registerUseCase(
            e.email,
            e.password,
            name: e.name,
          );
          emit(AuthState.authenticated(user));
        } catch (err) {
          emit(AuthState.error(err.toString()));
        }
      },
      logout: (e) async {
        await _logoutUseCase();
        emit(const AuthState.unauthenticated());
      },
      checkAuthStatus: (e) async {
        emit(const AuthState.loading());
        try {
          final firebaseUser = FirebaseAuth.instance.currentUser;
          if (firebaseUser != null) {
            final user = UserModel(
              email: firebaseUser.email ?? '',
              name: firebaseUser.displayName ?? '',
              uid: firebaseUser.uid,
            );
            emit(AuthState.authenticated(user));
          } else {
            emit(const AuthState.unauthenticated());
          }
        } catch (err) {
          emit(const AuthState.unauthenticated());
        }
      },
    );
  }
}

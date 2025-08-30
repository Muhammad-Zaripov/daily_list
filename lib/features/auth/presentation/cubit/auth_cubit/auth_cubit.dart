import 'package:daily_list/core/error/error_model.dart';
import 'package:daily_list/features/auth/domain/usecases/login_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/register_use_case.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  AuthCubit(this._loginUseCase, this._registerUseCase)
    : super(const AuthState.initial());

  void login({required String email, required String password}) async {
    emit(const AuthState.loading());
    try {
      final request = await _loginUseCase.call(
        LoginUseCaseParams(email: email, password: password),
      );
      emit(AuthState.success(request));
    } on FirebaseAuthException catch (e) {
      emit(AuthState.error(ErrorModel(message: e.message ?? "")));
    } catch (e) {
      emit(AuthState.error(ErrorModel(message: e.toString())));
    }
  }

  void register({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(const AuthState.loading());
    try {
      final request = await _registerUseCase.call(
        RegisterUseCaseParams(name: name, email: email, password: password),
      );
      emit(AuthState.success(request));
    } on FirebaseAuthException catch (e) {
      emit(AuthState.error(ErrorModel(message: e.message ?? "")));
    } catch (e) {
      emit(AuthState.error(ErrorModel(message: e.toString())));
    }
  }
}

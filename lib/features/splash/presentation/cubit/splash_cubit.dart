import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.loading());
  void init() async {
    emit(const SplashState.loading());
    await Future.delayed(Duration(seconds: 5));
    emit(const SplashState.language());
  }
}

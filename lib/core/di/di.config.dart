// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/login_use_case.dart' as _i37;
import '../../features/auth/domain/usecases/register_use_case.dart' as _i97;
import '../../features/auth/presentation/cubit/auth_cubit/auth_cubit.dart'
    as _i788;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i787.AuthRepository>(() => _i153.AuthRepositoryImpl());
    gh.factory<_i97.RegisterUseCase>(
      () => _i97.RegisterUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i37.LoginUseCase>(
      () => _i37.LoginUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i788.AuthCubit>(
      () =>
          _i788.AuthCubit(gh<_i37.LoginUseCase>(), gh<_i97.RegisterUseCase>()),
    );
    return this;
  }
}

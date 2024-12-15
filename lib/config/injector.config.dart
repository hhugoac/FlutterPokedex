// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart' as _i695;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pokedex/config/injector_module.dart' as _i1025;
import 'package:pokedex/data/pokemon_api.dart' as _i266;
import 'package:pokedex/data/repository/pokemon_repository_impl.dart' as _i363;
import 'package:pokedex/domain/repositories/pokemon_repository.dart' as _i63;
import 'package:pokedex/presentation/bloc/bloc/home_bloc.dart' as _i660;
import 'package:pokedex/presentation/view/pokemon_details/bloc/pokemon_details_bloc.dart'
    as _i357;
import 'package:pokedex/route/app_router.dart' as _i340;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectorModule = _$InjectorModule();
    gh.factory<_i695.CacheOptions>(() => injectorModule.cacheOptions);
    gh.lazySingleton<_i340.AppRouter>(() => injectorModule.appRouter);
    gh.lazySingleton<_i266.PokemonApi>(() => injectorModule.pokemonApi);
    gh.lazySingleton<_i63.PokemonRepository>(
        () => _i363.PokemonRepositoryImpl(gh<_i266.PokemonApi>()));
    gh.factory<_i357.PokemonDetailsBloc>(
        () => _i357.PokemonDetailsBloc(gh<_i63.PokemonRepository>()));
    gh.factory<_i660.HomeBloc>(
        () => _i660.HomeBloc(gh<_i63.PokemonRepository>()));
    return this;
  }
}

class _$InjectorModule extends _i1025.InjectorModule {}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [PokemonDetailsScreen]
class PokemonDetailsRoute extends PageRouteInfo<PokemonDetailsRouteArgs> {
  PokemonDetailsRoute({
    required Pokemon pokemon,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PokemonDetailsRoute.name,
          args: PokemonDetailsRouteArgs(
            pokemon: pokemon,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PokemonDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PokemonDetailsRouteArgs>();
      return PokemonDetailsScreen(
        args.pokemon,
        key: args.key,
      );
    },
  );
}

class PokemonDetailsRouteArgs {
  const PokemonDetailsRouteArgs({
    required this.pokemon,
    this.key,
  });

  final Pokemon pokemon;

  final Key? key;

  @override
  String toString() {
    return 'PokemonDetailsRouteArgs{pokemon: $pokemon, key: $key}';
  }
}

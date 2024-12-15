import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/config/injector.dart';
import 'package:pokedex/data/pokemon_api.dart';
import 'package:pokedex/route/app_router.dart';

void main() {
  configure('dev');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    GetIt.I.get<PokemonApi>().getPokemonList();
    final router = GetIt.I.get<AppRouter>();
    return MaterialApp.router(
      title: 'Pokedex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router.config(),
    );
  }
}

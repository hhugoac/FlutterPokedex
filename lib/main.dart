import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/config/injector.dart';
import 'package:pokedex/data/pokemon_api.dart';
import 'package:pokedex/presentation/view/home_screen.dart';

void main() {
  configure('dev');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    GetIt.I.get<PokemonApi>().getPokemonList();
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

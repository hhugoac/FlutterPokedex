import 'package:pokedex/model/pokemon.dart';

abstract class PokemonRepository {
  Stream<List<Pokemon>> get pokemonList;
  Future<void> loadMorePokemon();
  Future<Pokemon> getPokemon(String id);
  Future<Pokemon> searchPokemon(String query);
}

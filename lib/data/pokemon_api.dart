import 'package:dio/dio.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/model/pokemon_list_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'pokemon_api.g.dart';

@RestApi(baseUrl: 'http://pokeapi.co/api/v2/')
abstract class PokemonApi {
  factory PokemonApi(Dio dio, {String baseUrl}) = _PokemonApi;

  @GET('pokemon')
  Future<PokemonListResponse> getPokemonList({
    @Query('limit') int? limit,
    @Query('limit') int? offset,
  });

  @GET('pokemon/{query}/')
  Future<Pokemon> getPokemon(@Path('query') String? id);
}

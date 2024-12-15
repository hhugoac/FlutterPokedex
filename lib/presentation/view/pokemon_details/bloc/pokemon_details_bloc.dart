import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/model/pokemon.dart';

part 'pokemon_details_bloc.freezed.dart';
part 'pokemon_details_event.dart';
part 'pokemon_details_state.dart';

@injectable
class PokemonDetailsBloc
    extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  PokemonDetailsBloc(this._pokemonRepository)
      : super(const PokemonDetailsState.initial()) {
    on<_Load>(_onLoad);
  }
  final PokemonRepository _pokemonRepository;

  Future<void> _onLoad(_Load event, Emitter<PokemonDetailsState> emit) async {
    emit(const PokemonDetailsState.loadInProgress());
    final id = event.pokemon.pokemonId;
    if (id == null) {
      emit(const PokemonDetailsState.loadFailure());
      return;
    }
    await _pokemonRepository.getPokemon(id).then((pokemon) {
      emit(PokemonDetailsState.loadSuccess(pokemon));
    }).catchError((error) {
      log(error);
      emit(const PokemonDetailsState.loadFailure());
    });
  }
}

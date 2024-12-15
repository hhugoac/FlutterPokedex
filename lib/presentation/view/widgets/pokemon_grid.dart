import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/presentation/bloc/bloc/home_bloc.dart';
import 'package:pokedex/presentation/view/widgets/pokemon_item.dart';

class PokemonGrid extends StatefulWidget {
  final List<Pokemon> pokemonList;
  const PokemonGrid(this.pokemonList, {super.key});

  @override
  State<PokemonGrid> createState() => _PokemonGridState();
}

class _PokemonGridState extends State<PokemonGrid> {
  final _scrollController = ScrollController();

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void initState() {
    _scrollController.addListener(() => _onScroll(context));
    super.initState();
  }

  _onScroll(BuildContext context) {
    if (_isBottom) {
      context.read<HomeBloc>().add(const HomeEvent.load());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 0.8,
        mainAxisSpacing: 10,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: widget.pokemonList.length,
      itemBuilder: (_, index) =>
          PokemonItem(pokemon: widget.pokemonList[index]),
      controller: _scrollController,
    );
  }
}

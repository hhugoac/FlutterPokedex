import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/presentation/bloc/bloc/home_bloc.dart';
import 'package:pokedex/presentation/view/home/widgets/pokemon_grid.dart';
import 'package:pokedex/presentation/view/home/widgets/pokemon_searcher.dart';
import 'package:pokedex/route/app_router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon'),
      ),
      body: BlocProvider(
        create: (context) => GetIt.I.get<HomeBloc>()
          ..add(const HomeEvent.listenPokemonList())
          ..add(const HomeEvent.load()),
        child: Stack(
          children: [
            BlocConsumer<HomeBloc, HomeState>(
              buildWhen: (previous, current) =>
                  current != const LoadInProgress() &&
                  current is! PokemonFound &&
                  current is! PokemonNotFound,
              builder: (context, state) {
                return Stack(children: [
                  state.maybeWhen(
                      orElse: () => const SizedBox.shrink(),
                      loadSuccess: PokemonGrid.new,
                      loadFailure: () => const Center(
                            child: Text('Failed to load data'),
                          )),
                  PokemonSearcher(
                    onSearch: (text) =>
                        context.read<HomeBloc>().add(HomeEvent.search(text)),
                  )
                ]);
              },
              listener: (context, state) => {
                state.maybeWhen(
                    pokemonFound: (pokemon) {
                      context.router
                          .push(PokemonDetailsRoute(pokemon: pokemon));
                    },
                    pokemonNotFound: () {
                      return ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                        content: Text(
                          'Poemon not found',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Colors.red,
                      ));
                    },
                    orElse: () {}),
              },
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is LoadInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
}

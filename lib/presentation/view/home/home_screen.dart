import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/presentation/bloc/bloc/home_bloc.dart';
import 'package:pokedex/presentation/view/home/widgets/pokemon_grid.dart';

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
        child: Stack(children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return state.maybeWhen(
                  orElse: () => const SizedBox.shrink(),
                  loadSuccess: PokemonGrid.new,
                  loadFailure: () => const Center(
                        child: Text('Failed to load data'),
                      ));
            },
          ),
          BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            if (state is LoadInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SizedBox.shrink();
          }),
        ]),
      ),
    );
  }
}

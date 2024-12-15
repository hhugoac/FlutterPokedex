import 'package:flutter/material.dart';

class PokemonSearcher extends StatefulWidget {
  final void Function(String)? onSearch;
  const PokemonSearcher({this.onSearch, super.key});

  @override
  State<PokemonSearcher> createState() => _PokemonSearcherState();
}

class _PokemonSearcherState extends State<PokemonSearcher> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: ShapeBorder.lerp(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          1),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
            hintText: 'seacrh',
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            filled: true,
            suffixIcon: IconButton(
                onPressed: () => widget.onSearch?.call(_controller.text),
                icon: const Icon(Icons.search)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}

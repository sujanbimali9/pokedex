import 'package:flutter/material.dart';
import 'package:pokedex/features/home/domain/entity/pokemon_types.dart';

class PokmonTypeChip extends StatelessWidget {
  const PokmonTypeChip({
    super.key,
    required this.type,
    this.margin,
  });
  final PokemonType type;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 13),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        type.type.name,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

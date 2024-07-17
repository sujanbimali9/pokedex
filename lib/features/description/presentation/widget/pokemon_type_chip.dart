import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pokedex/core/models/type.dart';
import 'package:pokedex/core/utils/color/type_color.dart';

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
      padding: const EdgeInsets.only(top: 4, bottom: 4, right: 13, left: 4),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/icons/${type.name}.svg',
            width: 20,
            height: 20,
            color: PokemonTypeColor.getColorForType(type.name),
          ),
          const SizedBox(width: 5),
          Text(
            type.name,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

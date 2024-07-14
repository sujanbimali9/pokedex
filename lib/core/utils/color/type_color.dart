import 'package:flutter/material.dart';

@immutable
class PokemonTypeColor {
  static const Map<String, Color> _typeColors = {
    'bug': Color(0xFF94BC4A),
    'dark': Color(0xFF736C75),
    'dragon': Color(0xFF6A7BAF),
    'electric': Color(0xFFE5C531),
    'fairy': Color(0xFFE397D1),
    'fighting': Color(0xFFCB5F48),
    'fire': Color(0xFFEA7A3C),
    'flying': Color(0xFF7DA6DE),
    'ghost': Color(0xFF846AB6),
    'grass': Color(0xFF71C558),
    'ground': Color(0xFFCC9F4F),
    'ice': Color(0xFF70CBD4),
    'normal': Color(0xFFAAB09F),
    'poison': Color(0xFFB468B7),
    'psychic': Color(0xFFE5709B),
    'rock': Color(0xFFB2A061),
    'steel': Color(0xFF89A1B0),
    'water': Color(0xFF539AE2),
    'other': Color.fromARGB(255, 2, 178, 125)
  };

  static Color getColorForType(String type) {
    return _typeColors[type.toLowerCase()] ?? const Color(0xFF71C558);
  }
}

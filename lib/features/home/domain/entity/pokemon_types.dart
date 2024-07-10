class PokemonType {
  int slot;
  TypeDetail type;

  PokemonType({
    required this.slot,
    required this.type,
  });
}

class TypeDetail {
  String name;
  String url;

  TypeDetail({
    required this.name,
    required this.url,
  });
}

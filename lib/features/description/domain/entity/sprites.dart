class Sprites {
  final int id;
  final OtherSprites others;
  final String? backShiny;
  final String? backFemale;
  final String? frontShiny;
  final String? backDefault;
  final String? frontFemale;
  final String? frontDefault;
  final String? backShinyFemale;
  final String? frontShinyFemale;

  Sprites({
    required this.id,
    required this.others,
    this.backShiny,
    this.backFemale,
    this.frontShiny,
    this.backDefault,
    this.frontFemale,
    this.frontDefault,
    this.backShinyFemale,
    this.frontShinyFemale,
  });
}

class OtherSprites {
  final int id;
  final String? homeFrontShiny;
  final String? homeFrontFemale;
  final String? homeFrontDefault;
  final String? showdownBackShiny;
  final String? showdownBackFemale;
  final String? showdownFrontShiny;
  final String? showdownBackDefault;
  final String? showdownFrontFemale;
  final String? homeFrontShinyFemale;
  final String? showdownFrontDefault;
  final String? dreamWorldFrontFemale;
  final String? dreamWorldFrontDefault;
  final String? showdownBackShinyFemale;
  final String? showdownFrontShinyFemale;
  final String? officialArtworkFrontShiny;
  final String? officialArtworkFrontDefault;

  OtherSprites({
    required this.id,
    this.homeFrontShiny,
    this.homeFrontFemale,
    this.homeFrontDefault,
    this.showdownBackShiny,
    this.showdownBackFemale,
    this.showdownFrontShiny,
    this.showdownBackDefault,
    this.showdownFrontFemale,
    this.homeFrontShinyFemale,
    this.showdownFrontDefault,
    this.dreamWorldFrontFemale,
    this.dreamWorldFrontDefault,
    this.showdownBackShinyFemale,
    this.showdownFrontShinyFemale,
    this.officialArtworkFrontShiny,
    this.officialArtworkFrontDefault,
  });
}

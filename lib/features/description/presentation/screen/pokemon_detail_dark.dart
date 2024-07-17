// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pokedex/core/utils/color/type_color.dart';
// import 'package:pokedex/features/description/presentation/bloc/pokemon_detail_bloc.dart';
// import 'package:pokedex/features/home/domain/entity/pokemon_entity.dart';
// import 'package:pokedex/main.dart';

// class DarkPokemonDetailScreen extends StatefulWidget {
//   const DarkPokemonDetailScreen({super.key, required this.pokemon});
//   final Pokemon pokemon;

//   @override
//   State<DarkPokemonDetailScreen> createState() =>
//       _DarkPokemonDetailScreenState();
// }

// class _DarkPokemonDetailScreenState extends State<DarkPokemonDetailScreen> {
//   @override
//   void initState() {
//     context
//         .read<PokemonDetailBloc>()
//         .add(PokemonDetailEvent.getPokemonDetails(widget.pokemon));
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back),
//         ),
//         centerTitle: true,
//         title: Text('#0${widget.pokemon.id}',
//             style: const TextStyle(color: Colors.white)),
//       ),
//       extendBodyBehindAppBar: true,
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(height: 50),
//             Stack(
//               alignment: Alignment.bottomCenter,
//               children: [
//                 Container(
//                   height: screenSize.width,
//                   width: screenSize.width,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     gradient: RadialGradient(
//                       colors: [
//                         PokemonTypeColor.getColorForType(
//                             widget.pokemon.pokemonTypes.first.type.name),
//                         Colors.black
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: screenSize.width / 3.5,
//                   child: Hero(
//                     tag: 'pokemon-${widget.pokemon.id}',
//                     child: CachedNetworkImage(
//                       imageUrl: widget.pokemon.imageUrl,
//                       width: screenSize.width * 0.5,
//                     ),
//                   ),
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       widget.pokemon.name,
//                       style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 35,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       widget.pokemon.pokemonTypes
//                           .map((e) => e.type.name)
//                           .join('/'),
//                       style: const TextStyle(fontSize: 20, color: Colors.grey),
//                     ),
//                     const SizedBox(height: 20)
//                   ],
//                 ),
//               ],
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: list
//                     .map((e) => Padding(
//                           padding: const EdgeInsets.only(left: 15),
//                           child: FilterChip(
//                             label: Text(
//                               e,
//                               style: const TextStyle(color: Colors.white),
//                             ),
//                             onSelected: (value) {},
//                             selectedColor: Colors.red,
//                             selected: true,
//                             showCheckmark: false,
//                             shape: RoundedRectangleBorder(
//                                 side: const BorderSide(
//                                     color: Colors.white, width: 0.5),
//                                 borderRadius: BorderRadius.circular(20)),
//                             color: const WidgetStatePropertyAll(Colors.black),
//                           ),
//                         ))
//                     .toList(),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.all(25.0),
//               child: Column(
//                 children: [
//                   Text(
//                     'Arcanine is known for its high speed and attack stats.',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   // SizedBox(
//                   //   height: 200,
//                   //   child: ListView.builder(
//                   //     itemCount: 5,
//                   //     physics: const NeverScrollableScrollPhysics(),
//                   //     itemBuilder: (BuildContext context, int index) {
//                   //       return const PokemonStats();
//                   //     },
//                   //   ),
//                   // )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

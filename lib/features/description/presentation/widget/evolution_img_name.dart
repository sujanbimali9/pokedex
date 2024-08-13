import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/custom_shape/poke_ball.dart';

class EvolutionImgWithName extends StatelessWidget {
  const EvolutionImgWithName({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ClipPath(
              clipper: PokeBallClipper(),
              child: Container(
                height: 100,
                width: 100,
                color: const Color.fromARGB(255, 75, 72, 72).withOpacity(0.2),
              ),
            ),
            CachedNetworkImage(
                errorWidget: (context, url, error) {
                  return const Icon(Icons.error);
                },
                width: screenSize.width * 0.3,
                imageUrl: imageUrl),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 17),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

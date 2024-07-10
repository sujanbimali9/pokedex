import 'package:flutter/material.dart';
import 'package:pokedex/main.dart';

class DarkPokemonDetailScreen extends StatelessWidget {
  const DarkPokemonDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('#0059', style: TextStyle(color: Colors.white)),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: screenSize.width,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const RadialGradient(
                      colors: [Colors.red, Colors.black],
                    ),
                  ),
                  child: Image.asset(
                    'assets/growlith.png',
                    height: screenSize.width * 0.2,
                    width: screenSize.width * 0.2,
                  ),
                ),
                const Positioned(
                    bottom: 10,
                    child: Column(
                      children: [
                        Text(
                          'Arcanine',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Fire / Rock',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ],
                    )),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: list
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: FilterChip(
                            label: Text(
                              e,
                              style: const TextStyle(color: Colors.white),
                            ),
                            onSelected: (value) {},
                            selectedColor: Colors.red,
                            selected: true,
                            showCheckmark: false,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Colors.white, width: 0.5),
                                borderRadius: BorderRadius.circular(20)),
                            color: const WidgetStatePropertyAll(Colors.black),
                          ),
                        ))
                    .toList(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Text(
                    'Arcanine is known for its high speed and attack stats.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // SizedBox(
                  //   height: 200,
                  //   child: ListView.builder(
                  //     itemCount: 5,
                  //     physics: const NeverScrollableScrollPhysics(),
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return const PokemonStats();
                  //     },
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

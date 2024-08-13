import 'package:flutter/material.dart';

class PokemonStats extends StatelessWidget {
  const PokemonStats({
    super.key,
    this.textColor = Colors.white,
    required this.statName,
    this.statValue,
    required this.indicatorColor,
  });
  final Color textColor;
  final Color indicatorColor;
  final String statName;
  final int? statValue;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double maxBarWidth = screenSize.width * 0.5;
    final double barWidth = ((statValue ?? 0) / 255) * maxBarWidth;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          statName,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Spacer(),
        Text(
          statValue != null ? '$statValue' : '',
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 15,
                width: maxBarWidth.clamp(0, maxBarWidth),
                decoration: BoxDecoration(
                  color: indicatorColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                height: 15,
                width: barWidth,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      indicatorColor,
                      indicatorColor.withOpacity(0.9),
                      indicatorColor.withOpacity(0.6),
                      indicatorColor.withOpacity(0.4)
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CustomFilterChip extends StatelessWidget {
  const CustomFilterChip(
      {super.key,
      required this.isSelected,
      required this.label,
      this.selectedColor,
      required this.onPressed});
  final bool isSelected;
  final String label;
  final Color? selectedColor;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: isSelected ? selectedColor ?? Colors.blue : null,
          border: Border.all(
              color: isSelected ? selectedColor ?? Colors.blue : Colors.black)),
      child: InkWell(
        onTap: () => onPressed(label),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Text(label),
        ),
      ),
    );
  }
}

import 'package:chatex/ui/themes/main/colors.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  final String text;
  final int selectedIndex;
  final int index;
  final Function setSelectedIndex;

  CategorySelector(
      {this.text, this.index, this.selectedIndex, this.setSelectedIndex});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: setSelectedIndex,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 21.0,
              color:
                  index == selectedIndex ? subColor : subColor.withOpacity(0.3),
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2),
        ),
      ),
    );
  }
}

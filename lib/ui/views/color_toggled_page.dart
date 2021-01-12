import 'dart:math';

import 'package:chatex/ui/components/details_header.dart';
import 'package:flutter/material.dart';

class ColorToggledPage extends StatefulWidget {
  @override
  _ColorToggledPageState createState() => _ColorToggledPageState();
}

class _ColorToggledPageState extends State<ColorToggledPage> {
  Color randomColor;

  void generateRandomColor() {
    Random random = Random();
    random.nextInt(255);
    setState(() {
      randomColor = Color.fromARGB(
          255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: randomColor ?? null,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => generateRandomColor(),
        child: SafeArea(
          child: Column(
            children: [
              DetailsHeader(
                title: 'ColorPage',
              ),
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 150,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text('Hey there or something'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

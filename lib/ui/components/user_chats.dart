import 'package:chatex/di/models/rick_chars_model.dart';
import 'package:chatex/ui/components/chat_template.dart';
import 'package:chatex/ui/themes/main/colors.dart';
import 'package:flutter/material.dart';

class UserChats extends StatelessWidget {
  final List<MovieCharModel> mcm;

  UserChats({this.mcm});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height - 350,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: lightBlue, borderRadius: BorderRadius.circular(25)),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: mcm.reversed
                  .map((e) => ChatTemplate(
                        item: e,
                        mcm: mcm,
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

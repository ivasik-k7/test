import 'package:chatex/di/models/rick_chars_model.dart';
import 'package:chatex/ui/components/favorite_contact.dart';
import 'package:chatex/ui/themes/main/colors.dart';
import 'package:flutter/material.dart';

class FavoriteContacts extends StatelessWidget {
  List<MovieCharModel> mcm;

  FavoriteContacts({this.mcm});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: lightBlue),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Favorite Contacts',
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(icon: Icon(Icons.more), onPressed: () {})
                    ],
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                          child: Row(
                        children:
                            mcm.map((e) => FavoriteContact(item: e)).toList(),
                      )))
                ],
              )),
        ),
      ],
    );
  }
}

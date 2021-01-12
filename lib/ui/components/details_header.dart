import 'package:chatex/ui/themes/main/colors.dart';
import 'package:flutter/material.dart';

class DetailsHeader extends StatelessWidget {
  final String title;
  DetailsHeader({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 22,
              color: subColor,
              onPressed: () => Navigator.of(context).pop()),
          SizedBox(
            width: 12,
          ),
          Text(
            title == null ? 'Person Details' : title,
            style: TextStyle(
                color: subColor, fontSize: 28, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

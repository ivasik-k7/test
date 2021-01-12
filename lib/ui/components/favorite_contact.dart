import 'package:chatex/di/models/rick_chars_model.dart';
import 'package:chatex/ui/themes/main/colors.dart';
import 'package:chatex/ui/views/adressant_details.dart';
import 'package:flutter/material.dart';

class FavoriteContact extends StatelessWidget {
  final MovieCharModel item;

  FavoriteContact({this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => AddressantDetails(
                item: item,
              ))),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                    height: 62,
                    width: 62,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 2, color: subColor)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.network(
                          item.imageURI,
                        ))),
                Positioned(
                    top: -20,
                    left: -20,
                    child: IconButton(
                        icon: Icon(Icons.star),
                        iconSize: 25,
                        color: Colors.yellow[800],
                        onPressed: () {})),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Text(item.name.length <= 10
                ? item.name
                : item.name.substring(0, 10) + '...'),
          ],
        ),
      ),
    );
  }
}

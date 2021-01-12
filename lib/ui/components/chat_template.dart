import 'package:chatex/di/models/rick_chars_model.dart';
import 'package:chatex/ui/themes/main/colors.dart';
import 'package:chatex/ui/views/adressant_details.dart';
import 'package:flutter/material.dart';

class ChatTemplate extends StatelessWidget {
  final MovieCharModel item;
  final List<MovieCharModel> mcm;

  ChatTemplate({this.item, this.mcm});

  void detailsRedirect(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => AddressantDetails(
              item: item,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.name),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          mcm.removeWhere((element) => element.id == item.id);

          Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Chat with ${item.name} has been deleted ')));
        }
      },
      child: GestureDetector(
        onTap: () {
          print(item.id);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => detailsRedirect(context),
                    child: Container(
                      height: 62,
                      width: 62,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(item.imageURI),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => detailsRedirect(context),
                        child: Text(
                            item.name.length <= 20
                                ? item.name
                                : item.name.substring(0, 18) + '...',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Message was crypted...',
                        style: TextStyle(
                            color: Colors.grey, fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.remove_moderator),
                      iconSize: 20,
                      color: subColor.withOpacity(0.7),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.archive),
                      color: subColor.withOpacity(0.7),
                      onPressed: () {})
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

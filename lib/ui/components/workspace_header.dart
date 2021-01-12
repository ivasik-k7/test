import 'package:chatex/ui/views/color_toggled_page.dart';
import 'package:flutter/material.dart';
import 'package:chatex/di/fakes/kFakeCategories.dart';

class WorkspaceHeader extends StatelessWidget {
  int selectedIndex;

  WorkspaceHeader({this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.menu), iconSize: 31, onPressed: () {}),
                SizedBox(
                  width: 20,
                ),
                Text(
                  kFakeCategories[selectedIndex],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
                )
              ],
            ),
          ),
          Container(
            child: IconButton(
                icon: Icon(Icons.near_me),
                color: Colors.amber[800].withOpacity(0.5),
                iconSize: 32,
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => ColorToggledPage()))),
          )
        ],
      ),
    );
  }
}

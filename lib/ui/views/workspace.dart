import 'package:chatex/di/fakes/kFakeCategories.dart';
import 'package:chatex/di/models/rick_chars_model.dart';
import 'package:chatex/di/services/rick_morty.dart';
import 'package:chatex/ui/components/category_selector.dart';
import 'package:chatex/ui/components/favorite_contact.dart';
import 'package:chatex/ui/components/favorite_contacts.dart';
import 'package:chatex/ui/components/user_chats.dart';
import 'package:chatex/ui/components/workspace_header.dart';
import 'package:chatex/ui/themes/main/colors.dart';
import 'package:flutter/material.dart';

class Workspace extends StatefulWidget {
  @override
  _WorkspaceState createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  int selectedTabIndex = 0;
  bool isLoading = true;
  BaseService bs = BaseService();
  List<MovieCharModel> mcm;

  void setSelectedTabIndex(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    bs.getListOfItems(setter: (e) {
      setState(() {
        mcm = e;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: <Widget>[
          WorkspaceHeader(
            selectedIndex: selectedTabIndex,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              child: Row(
                children: kFakeCategories
                    .map((e) => CategorySelector(
                          index: kFakeCategories.indexOf(e),
                          text: e,
                          selectedIndex: selectedTabIndex,
                          setSelectedIndex: () =>
                              setSelectedTabIndex(kFakeCategories.indexOf(e)),
                        ))
                    .toList(),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height - 160),
                decoration: BoxDecoration(
                    color: subColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: isLoading
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: <Widget>[
                    isLoading
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: CircularProgressIndicator(
                                backgroundColor: mainColor,
                              ),
                            ),
                          )
                        : SingleChildScrollView(
                            child: Container(
                              child: Column(
                                children: [
                                  FavoriteContacts(
                                    mcm: mcm,
                                  ),
                                  UserChats(
                                    mcm: mcm,
                                  )
                                ],
                              ),
                            ),
                          )
                  ],
                )),
          )
        ],
      )),
    );
  }
}

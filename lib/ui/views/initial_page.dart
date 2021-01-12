import 'package:chatex/ui/themes/main/colors.dart';
import 'package:chatex/ui/views/workspace.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  Widget renderIntroText({String text, double pv = 12, TextStyle style}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: pv),
      child: Text(
        text,
        style: style != null ? style : TextStyle(color: lightBlue),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Wilkomen zum fleish data',
            style: TextStyle(color: mainColor),
          ),
          backgroundColor: Theme.of(context).accentColor),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                renderIntroText(
                    text:
                        'Hallo, сорі я забув вже трохи німецьку тому далі буде на чомусь доступному'),
                renderIntroText(
                    text: 'Und ich mit meine company have ein deel vor dich!'),
                renderIntroText(text: 'Du kan lies any info wat du wilst')
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => Workspace()));
              },
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [subColor, mainColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Enter the void",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

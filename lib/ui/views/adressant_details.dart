import 'package:chatex/di/models/rick_chars_model.dart';
import 'package:chatex/ui/components/details_header.dart';
import 'package:flutter/material.dart';

class AddressantDetails extends StatefulWidget {
  MovieCharModel item;

  AddressantDetails({this.item});

  @override
  _AddressantDetailsState createState() => _AddressantDetailsState();
}

class _AddressantDetailsState extends State<AddressantDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          DetailsHeader(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Species: ${widget.item.species}'),
                    Text('Type: Unknown'),
                    Text('Gender: ${widget.item.gender}'),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.centerRight,
                  height: 320,
                  width: 240,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(28)),
                    child: Image.network(widget.item.imageURI),
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  widget.item.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  widget.item.location.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontStyle: FontStyle.italic),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

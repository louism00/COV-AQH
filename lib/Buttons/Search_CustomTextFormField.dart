import '../models/recherche.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchCustomTextFormField extends StatefulWidget {
  String myLabelText;
  Search mySearch;
  bool auDepart;

  SearchCustomTextFormField(
      this.myLabelText, this.mySearch, this.auDepart);

  @override
  _SearchCustomTextFormFieldState createState() => _SearchCustomTextFormFieldState();
}

class _SearchCustomTextFormFieldState extends State<SearchCustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
      child: Container(
        padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0.0),
        width: 300,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.amber[400],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.horizontal(
              right: Radius.circular(30.0), left: Radius.circular(30.0)),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: widget.myLabelText,
              hintStyle: TextStyle(
                color: Colors.black54,
                fontSize: 20.0,
              ),
              border: InputBorder.none,
            ),
            style: TextStyle(
              fontSize: 20.0,
            ),
            onSaved: (val) => setState(() => {
                  if (widget.auDepart)
                    {widget.mySearch.depart = val}
                  else
                    {widget.mySearch.arrivee = val}
                }),
          ),
        ),
      ),
    );
  }
}

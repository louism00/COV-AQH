import '../models/utilisateur.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCustomTextFormField extends StatefulWidget {
  String myLabelText;
  User myUser;
  bool auDepart;

  UserCustomTextFormField(
      this.myLabelText, this.myUser, this.auDepart);

  @override
  _UserCustomTextFormFieldState createState() => _UserCustomTextFormFieldState();
}

class _UserCustomTextFormFieldState extends State<UserCustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 0.0),
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
            obscureText: widget.auDepart,
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
                {widget.myUser.password = val}
              else
                {widget.myUser.login = val}
            }),
          ),
        ),
      ),
    );
  }
}
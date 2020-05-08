import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoutonAccueil extends StatelessWidget {
  final String buttonName;
  final Function onTap;

  BoutonAccueil(this.buttonName, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        width: 300,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.horizontal(
              right: Radius.circular(30.0), left: Radius.circular(30.0)),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Center(
            child: Text(
              buttonName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

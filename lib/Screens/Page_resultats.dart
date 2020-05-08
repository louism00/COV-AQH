import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageResultats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Résultats",
          style: TextStyle(
              fontSize: 35.0, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}

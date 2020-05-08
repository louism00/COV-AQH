import 'package:covaqh/Buttons/Custom_drawer.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PagePresentation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Présentation"),
        backgroundColor: Colors.deepOrange,
      ),
      drawer: CustomDrawer(),
    );
  }
}

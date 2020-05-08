import 'package:covaqh/Buttons/Custom_drawer.dart';
import 'package:covaqh/Buttons/bouton_acceuil.dart';
import 'package:covaqh/Screens/Page_rechercher.dart';
import './Page_proposer.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageAccueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "COV'AQH",
          style: TextStyle(fontSize: 30.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      drawer: CustomDrawer(),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(color: Colors.grey),
              child: Image(
                image: AssetImage('assets/route_soleil_couchant2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.3),
            child: BoutonAccueil("Proposer un trajet", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PageProposer()));
            }),
          ),
          Align(
            alignment: Alignment(0, 0.3),
            child: BoutonAccueil("Rechercher un trajet", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PageRechercher()));
            }),
          )
        ],
      ),
    );
  }
}

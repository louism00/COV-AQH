import 'package:covaqh/Screens/Page_Connexion.dart';
import 'package:covaqh/Screens/Page_presentation.dart';
import 'package:covaqh/Screens/Page_accueil.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Se déconnecter ?'),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'NON',
                style: TextStyle(
                  color: Colors.amber[600],
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                  "OUI",
                style: TextStyle(
                  color: Colors.amber[600],
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageConnexion()));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PageAccueil()));
            },
            child: DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                Colors.deepOrange,
                Colors.orangeAccent,
              ])),
              child: Image.asset(
                "assets/logo2.png",
                height: 60,
                width: 60,
              ),
            ),
          ),
          CustomListTile(Icons.question_answer, "Présentation", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PagePresentation()));
          }),
          CustomListTile(Icons.person, "Mon Profil", () => {}),
          CustomListTile(Icons.directions_car, "Mes trajets", () => {}),
          CustomListTile(Icons.contact_mail, "Nous Contacter", () => {}),
          CustomListTile(
              Icons.lock,
              "Se déconnecter",
              () => {
                    _showMyDialog(context),
                  }),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
          splashColor: Colors.orangeAccent,
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          text,
                          style: TextStyle(fontSize: 16.0),
                        )),
                  ],
                ),
                Icon(Icons.arrow_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

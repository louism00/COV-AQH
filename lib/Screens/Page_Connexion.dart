import 'package:covaqh/Screens/Page_accueil.dart';
import 'package:covaqh/models/utilisateur.dart';
import '../Buttons/Login_CustomTextFormField.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageConnexion extends StatefulWidget {
  @override
  _PageConnexionState createState() => _PageConnexionState();
}

class _PageConnexionState extends State<PageConnexion> {
  final _formKey = GlobalKey<FormState>();
  final _user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              UserCustomTextFormField("Identifiant", _user, false),
              UserCustomTextFormField("Mot de passe", _user, true),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 45, 30, 0),
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        final form = _formKey.currentState;
                        form.save();
                        _user.save();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PageAccueil()));
                      },
                      child: Container(
                        child: Text(
                          "Connexion",
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.amber[600],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

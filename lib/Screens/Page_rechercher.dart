import 'package:covaqh/Buttons/Custom_drawer.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../models/recherche.dart';
import '../Buttons/Search_CustomTextFormField.dart';
import 'dart:async';
import './Page_resultats.dart';
import 'package:intl/intl.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageRechercher extends StatefulWidget {
  @override
  _PageRechercherState createState() => _PageRechercherState();
}

class _PageRechercherState extends State<PageRechercher> {
  final _formKey = GlobalKey<FormState>();
  final _search = Search();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _search.aqd,
      firstDate: _search.aqd,
      lastDate: DateTime(_search.aqd.year + 1),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData(
            primaryColor: Colors.amber[400],
            accentColor: Colors.amber[400],
          ),
          child: child,
        );
      },
    );

    if (picked != null && picked != _search.aqd) {
      setState(() {
        _search.aqd = picked;
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _search.aqh,
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData(
            primaryColor: Colors.amber[400],
            accentColor: Colors.amber[400],
          ),
          child: child,
        );
      },
    );

    if (picked != null && picked != _search.aqh) {
      setState(() {
        _search.aqh = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("fr_FR", null);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Où va t-on ?",
          style: TextStyle(
              fontSize: 35.0, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      drawer: CustomDrawer(),
      body: Container(
        child: Builder(
          builder: (context) => Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SearchCustomTextFormField("Départ", _search, true),
                SearchCustomTextFormField("Destination", _search, false),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 30, 50, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Container(
                          child: Text(
                            DateFormat.yMMMd("fr_FR").format(_search.aqd),
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.amber[600],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _selectTime(context);
                        },
                        child: Container(
                          child: Text(
                            _search.aqh.format(context),
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.amber[600],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
                  child: Container(
                    child: RaisedButton(
                      color: Colors.amber[400],
                      child: Text(
                        "Ca part !",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () {
                        final form = _formKey.currentState;
                        form.save();
                        _search.save();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PageResultats()));
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        image: DecorationImage(
                          image: AssetImage("assets/vans_banner4.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

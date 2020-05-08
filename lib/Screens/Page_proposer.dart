import 'package:covaqh/Buttons/Custom_drawer.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../models/proposition.dart';
import '../Buttons/Submit_CustomTextFormField.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageProposer extends StatefulWidget {
  @override
  _PageProposerState createState() => _PageProposerState();
}

class _PageProposerState extends State<PageProposer> {
  final _formKey = GlobalKey<FormState>();
  final _submit = Submit();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _submit.aqd,
      firstDate: _submit.aqd,
      lastDate: DateTime(_submit.aqd.year + 1),
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

    if (picked != null && picked != _submit.aqd) {
      setState(() {
        _submit.aqd = picked;
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _submit.aqh,
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

    if (picked != null && picked != _submit.aqh) {
      setState(() {
        _submit.aqh = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("fr_FR", null);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Proposez votre trajet !",
          style: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.w600, color: Colors.white),
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
                SubmitCustomTextFormField("Départ", _submit, true),
                SubmitCustomTextFormField("Destination", _submit, false),
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
                            DateFormat.yMMMd("fr_FR").format(_submit.aqd),
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
                            _submit.aqh.format(context),
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
                        "Vive le DD !",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () {
                        final form = _formKey.currentState;
                        form.save();
                        _submit.save();
                        _showDialog(context);
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
                          image: AssetImage("assets/vans_banner3.jpg"),
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

  _showDialog(BuildContext context) {
    Scaffold.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.amber[400],
          content: Text(
              "Votre trajet a été publié, merci !",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),));
  }

}

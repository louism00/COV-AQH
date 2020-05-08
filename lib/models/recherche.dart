
import 'package:flutter/material.dart';

class Search {
  String firstName = "Provençal";
  String lastName = "Le Gaulois";
  // Ces infos seront à terme mises à jour par la connexion de l'utilisateur à son compte en entrant dans l'appli

  String depart = '';
  String arrivee = '';
  DateTime aqd = DateTime.now();
  TimeOfDay aqh = TimeOfDay.now();
  //Les infos qui proviennent des champs de texte de la page rechercher
  //Il manque l'heure et la date

  //Save() correspond à ce qu'il se passe quand on appuie sur le bouton rechercher, c'est à dire on envoie une requête à la base de données
  save() {
    print("Envoi de la requête de recherche de trajet à la base de données: Départ = $depart, Arrivée = $arrivee, aqd = $aqd, aqh = $aqh");
  }

}

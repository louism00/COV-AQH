class User {
  String userFirstName = 'Provençal';
  String userLastName = 'Le Gaulois';

  String email = 'provençal.legaulois@gmail.com';
  String login = 'Le clan des Semi-Croustillants';
  String password = "PAYS DE GALLES INDEPENDANT";

  save() {
    print("Envoi de la requête de connexion à la base de données: Login = $login, Password = $password. Récupération des données Nom, Prénom et email.");
  }

  //Toutes ces infos proviennent de la connexion de l'utilisateur
}
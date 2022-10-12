import 'package:film_projet/filmListeScreen.dart';
import 'package:film_projet/filmScreen.dart';
import 'package:flutter/material.dart';
import 'apropos.dart';
import 'film.dart';
import 'main.dart';

class FilmAffiche extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FilmListeScreen());
  }
}

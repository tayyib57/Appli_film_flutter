import 'package:film_projet/favoriteWidget.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'film.dart';

class FilmScreen extends StatelessWidget {
  FilmScreen(this.film);
  final Film film;
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(film.title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              Text(
                film.user,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                ),
              )
            ],
          )),
          FavoriteWidget()
        ],
      ),
    );

    Widget buttonSection = Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        _buildButtonColumn(Colors.yellow, Icons.comment, "COMMENT"),
        _buildButtonColumn(Colors.yellow, Icons.share, "SHARE")
      ]),
    );

    Widget descriptionSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        film.description,
        softWrap: true,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Films"),
      ),
      body: Column(children: [
        Hero(
          tag: "imageFilm" + film.title,
          child: CachedNetworkImage(
            imageUrl: film.imageUrl,
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
        ),
        titleSection,
        buttonSection,
        descriptionSection
      ]),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Icon(icon, color: color)),
        Text(label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: color,
            ))
      ],
    );
  }
}

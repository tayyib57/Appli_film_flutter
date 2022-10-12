import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_projet/filmaffiche.dart';
import 'package:film_projet/filmscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'film.dart';

class FilmListeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FilmListeScreenState();
  }
}

class FilmListeScreenState extends State<FilmListeScreen> {
  final List<Film> films = [
    Film(
        "Titanic",
        "Par James Cameron",
        "https://fr.web.img6.acsta.net/c_310_420/pictures/19/10/25/11/18/5224976.jpg",
        "Southampton, 10 avril 1912. Le paquebot le plus grand et le plus moderne du monde, réputé pour son insubmersibilité, le Titanic, appareille pour son premier voyage. Quatre jours plus tard, il heurte un iceberg. A son bord, un artiste pauvre et une grande bourgeoise tombent amoureux."),
    Film(
        "Batman",
        "Par Matt Reeves",
        "https://fr.web.img3.acsta.net/c_310_420/pictures/22/02/16/17/42/3125788.jpg",
        "Deux années à arpenter les rues en tant que Batman et à insuffler la peur chez les criminels ont mené Bruce Wayne au coeur des ténèbres de Gotham City. Avec seulement quelques alliés de confiance - Alfred Pennyworth, le lieutenant James Gordon - parmi le réseau corrompu de fonctionnaires et de personnalités de la ville, le justicier solitaire s'est imposé comme la seule incarnation de la vengeance parmi ses concitoyens."),
    Film(
        "Expendables",
        "Par Sylvester Stallone",
        "https://fr.web.img6.acsta.net/c_310_420/medias/nmedia/18/78/57/80/19472891.jpg",
        "Ce ne sont ni des mercenaires, ni des agents secrets. Ils choisissent eux-mêmes leurs missions et n'obéissent à aucun gouvernement. Ils ne le font ni pour l'argent, ni pour la gloire, mais parce qu'ils aident les cas désespérés. Depuis dix ans, Izzy Hands, de la CIA, est sur les traces du chef de ces hommes, Barney Ross."),
    Film(
        "Top Gun",
        "Par Tony Scott",
        "https://fr.web.img4.acsta.net/c_310_420/pictures/15/06/12/12/58/422779.jpg",
        "Jeune as du pilotage et tête brûlée d'une école réservée à l'élite de l'aéronavale US Top Gun, Pete Mitchell, dit Maverick, tombe sous le charme d'une instructrice alors qu'il est en compétition pour le titre du meilleur pilote"),
    Film(
        "La ligne verte",
        "Par Franck Darabont",
        "https://fr.web.img2.acsta.net/c_310_420/medias/nmedia/18/66/15/78/19254683.jpg",
        "Paul Edgecomb, pensionnaire centenaire d'une maison de retraite, est hanté par ses souvenirs. Gardien-chef du pénitencier de Cold Mountain en 1935, il était chargé de veiller au bon déroulement des exécutions capitales en s’efforçant d'adoucir les derniers moments des condamnés. Parmi eux se trouvait un colosse du nom de John Coffey, accusé du viol et du meurtre de deux fillettes. Intrigué par cet homme candide et timide aux dons magiques, Edgecomb va tisser avec lui des liens très forts.")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Films"),
      ),
      body: ListView.builder(
          itemCount: films.length,
          itemBuilder: (context, index) {
            final film = films[index];
            return Dismissible(
                key: Key(film.title),
                onDismissed: (direction) {
                  setState(() {
                    films.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${film.title} supprimé")));
                },
                background: Container(color: Colors.red),
                child: FilmItemWidget(films[index]));
          }),
    );
  }
}

class FilmItemWidget extends StatelessWidget {
  const FilmItemWidget(this.film) : super();
  final Film film;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      FilmScreen(film),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    animation =
                        CurvedAnimation(curve: Curves.ease, parent: animation);
                    return FadeTransition(opacity: animation, child: child);
                  }));
        },
        child: Card(
            margin: EdgeInsets.all(8),
            elevation: 8,
            child: Row(
              children: [
                Hero(
                  tag: "imageFilm" + film.title,
                  child: CachedNetworkImage(
                    imageUrl: film.imageUrl,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(film.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    Text(film.user,
                        style: TextStyle(color: Colors.grey[500], fontSize: 16))
                  ],
                )
              ],
            )));
  }
}

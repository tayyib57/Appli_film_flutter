import 'package:film_projet/filmListeScreen.dart';
import 'package:flutter/material.dart';
import 'filmAffiche.dart';
import 'apropos.dart';
import 'package:carousel_images/carousel_images.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Film M&A',
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          surface: Color.fromRGBO(255, 235, 59, 1),
          onSurface: Colors.black,
          // Colors that are not relevant to AppBar in DARK mode:
          primary: Colors.grey,
          onPrimary: Colors.grey,
          primaryVariant: Colors.grey,
          secondary: Colors.grey,
          secondaryVariant: Colors.grey,
          onSecondary: Colors.grey,
          background: Colors.grey,
          onBackground: Colors.grey,
          error: Colors.grey,
          onError: Colors.grey,
        ),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        //primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

listImage(String s) {}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  final List<String> listImages = [
    'assets/th1.jpg',
    'assets/th2.jpg',
    'assets/th3.jpg',
    'assets/th4.jpg',
    'assets/th5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              '' +
                  '\n\n' +
                  'Bienvenue sur la plateforme de streaming M&A ' +
                  '\n\n' +
                  'sur ce site vous verrez une brève description de nos meilleurs films avec un petit résumé ' +
                  '\n\n' +
                  'n hésitez pas à laisser un j aime et un commentaire ' +
                  '\n\n' +
                  'swipper à droite pour voir les films à l affiche ' +
                  '\n\n' +
                  '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 18,
              ),
            ),
            CarouselImages(
              scaleFactor: 0.6,
              listImages: listImages,
              height: 300.0,
              borderRadius: 30.0,
              cachedNetworkImage: true,
              verticalAlignment: Alignment.topCenter,
              onTap: (index) {
                print('Tapped on page $index');
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/logoam.png"),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    title: Text("ACCUEIL"),
                  ),
                  Divider(
                    height: 1.0,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FilmListeScreen()));
                    },
                    title: Text("FILMS"),
                  ),
                  Divider(
                    height: 1.0,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => APropos()));
                    },
                    title: Text("A PROPOS"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

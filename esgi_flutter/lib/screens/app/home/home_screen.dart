import 'package:esgi_flutter/app_routes.dart';
import 'package:esgi_flutter/screens/app/models/note.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = [
    Note(
        title: 'Cours Flutter #1',
        date: '23-07-2021',
        content:
            "Flutter est un kit de développement logiciel (SDK) d'interface utilisateur open-source créé par Google. Il est utilisé pour développer des applications pour Android, iOS, Linux, Mac, Windows, Google Fuchsia et le web à partir d'une seule base de code.",
        image: 'assets/images/flutter.png'),
    Note(
        title: 'Cours Philo #34',
        date: '23-07-2021',
        content:
            "La première version de Flutter était connue sous le nom de code Sky et fonctionnait sur le système d'exploitation Android. Elle a été dévoilée lors du sommet des développeurs Dart de 2015, avec l'intention déclarée de pouvoir effectuer un rendu cohérent à 120 images par seconde",
        image: 'assets/images/flutter2.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'MES NOTES',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Text(
                      'NOUVELLE NOTE',
                      textAlign: TextAlign.left,
                    ),
                    TextFormField(
                      minLines: 1,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        labelText: 'Titre',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.0),
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: TextFormField(
                        maxLines: 5,
                        decoration: const InputDecoration(
                          labelText: 'Contenu',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.0),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all<Color>(Colors.grey),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {},
                        child: const Text('Ajouter une image'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all<Color>(Colors.grey),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'AJOUTER MA NOTE',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  'MES NOTES SAUVEGARDÉES',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: notes.length,
                itemBuilder: (context, index) =>
                    buildNote(note: notes[index], context: context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// TODO Implement this library.

Widget buildNote({required Note note, required BuildContext context}) =>
    Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                note.title.toUpperCase(),
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                note.date,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  note.content,
                  style: const TextStyle(
                    color: Color.fromARGB(100, 50, 50, 50),
                    fontSize: 14,
                  ),
                ),
              ),
              Image(
                image: AssetImage(note.image),
              ),
              const Divider(
                color: Colors.black,
              ),
            ],
          ),
          onTap: () =>
              Navigator.pushNamed(context, detailsRoute, arguments: note)),
    );

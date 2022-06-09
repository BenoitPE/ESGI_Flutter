import 'package:esgi_flutter/screens/app/home/note.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = [
    Note(
        title: 'Note 1',
        date: '09/06/2022',
        content: 'Un contenu',
        image:
            'https://thumbs.dreamstime.com/b/fond-de-coeur-d-amour-d-arc-en-ciel-60045149.jpg'),
    Note(
        title: 'Note 2',
        date: '08/06/2022',
        content: 'Un deuxième contenu',
        image:
            'https://thumbs.dreamstime.com/b/fond-de-coeur-d-amour-d-arc-en-ciel-60045149.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
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
                        borderSide: BorderSide(color: Colors.black, width: 0.0),
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
            Container(
                height: 140,
                child: ListView.separated(
                  itemCount: notes.length,
                  separatorBuilder: (context, _) => SizedBox(width: 12),
                  itemBuilder: (context, index) =>
                      buildNote(note: notes[index], context: context),
                )),
          ],
        ),
      ),
    );
  }
}
// TODO Implement this library.

Widget buildNote({required Note note, required BuildContext context}) =>
    Container(
      child: Column(
        children: [
          Text(note.title),
          Text(note.date),
          Text(note.content),
          Ink.image(
            image: NetworkImage(note.image),
            fit: BoxFit.cover,
          ),
        ],
      ),
    );

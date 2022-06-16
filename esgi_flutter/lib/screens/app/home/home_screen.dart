import 'package:esgi_flutter/app_routes.dart';
import 'package:esgi_flutter/data/models/note.dart';
import 'package:esgi_flutter/data/repository/note_repository.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NoteRepository _noteRepository = NoteRepository();
  List<Note> notes = [];
  List<XFile> pickedImages = [];
  final titleInputController = TextEditingController();
  final contentInputController = TextEditingController();

  lunchCamera() async {
    pickedImages = [];
    final ImagePicker _picker = ImagePicker();
    var img = await _picker.pickImage(source: ImageSource.camera);
    print(img?.path);
    pickedImages.add(img!);
    setState(() {});
  }

  @override
  void initState() {
    getAllNotes();
    super.initState();
  }

  getAllNotes() async {
    notes = await _noteRepository.getAllNotes();
    setState(() {});
  }

  int id = Random.secure().nextInt(1000);
  DateTime today = new DateTime.now();
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
                      controller: titleInputController,
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
                        controller: contentInputController,
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
                      child: Row(
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all<Color>(Colors.grey),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () {
                              lunchCamera();
                            },
                            child: const Text('Ajouter une image'),
                          ),
                          pickedImages.isNotEmpty
                              ? Container(
                                  width: 80,
                                  height: 100,
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.file(File(pickedImages[0].path)),
                                )
                              : Container()
                        ],
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
                        onPressed: () => setState(
                          () => {
                            if (titleInputController.text != "" &&
                                contentInputController.text != "")
                              {
                                _noteRepository.addNote(Note(
                                    id: id,
                                    title: titleInputController.text,
                                    date:
                                        '${today.year}-${today.month}-${today.day}',
                                    content: contentInputController.text,
                                    image: pickedImages.isNotEmpty
                                        ? pickedImages[0].path
                                        : "")),
                                getAllNotes(),
                                titleInputController.clear(),
                                contentInputController.clear(),
                                pickedImages.clear(),
                              }
                            else
                              {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Row(
                                        children: [
                                          Text((() {
                                            if (titleInputController.text ==
                                                    "" &&
                                                contentInputController.text ==
                                                    "") {
                                              return "Veuillez saisir un titre\n et un contenu";
                                            } else if (titleInputController
                                                    .text ==
                                                "") {
                                              return "Veuillez saisir un titre";
                                            } else {
                                              return "Veuillez saisir un contenu";
                                            }
                                          })()),
                                          const CloseButton(),
                                        ],
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    );
                                  },
                                ),
                              },
                          },
                        ),
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
              note.image.isNotEmpty
                  ? Image.file(
                      File(note.image),
                    )
                  : Container(),
              const Divider(
                color: Colors.black,
              ),
            ],
          ),
          onTap: () =>
              Navigator.pushNamed(context, detailsRoute, arguments: note)),
    );

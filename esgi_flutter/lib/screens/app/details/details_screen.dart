import 'package:esgi_flutter/screens/app/home/note.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Note note;
  const DetailsPage({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Mes notes'.toUpperCase(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Scaffold(
        body: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                note.title.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Text(
                note.date,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text(
                  note.content,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(100, 50, 50, 50),
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
        ),
      ),
    );
  }
}

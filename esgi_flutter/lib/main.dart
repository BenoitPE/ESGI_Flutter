import 'package:esgi_flutter/app_routes.dart';
import 'package:esgi_flutter/screens/app/details/details_screen.dart';
import 'package:esgi_flutter/data/models/note.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ESGI Flutter - Projet Final',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: homeRoute,
      routes: routes,
      onGenerateRoute: (settings) {
        if (settings.name == detailsRoute) {
          return MaterialPageRoute(
            builder: (context) => DetailsScreen(
              note: settings.arguments as Note,
            ),
          );
        }
      },
    );
  }
}

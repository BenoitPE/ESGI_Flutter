import 'package:esgi_flutter/screens/app/home/home_screen.dart';
import 'package:flutter/material.dart';

const homeRoute = '/home';
const detailsRoute = '/details';

Map<String, WidgetBuilder> routes = {
  homeRoute: (context) => const HomeScreen(),
};

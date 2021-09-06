import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider/bottom_navigation_provider.dart';
import 'package:provider_test/provider/movie_provider.dart';
import 'package:provider_test/ui/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (BuildContext context) => BottomNavitionProvider()),
      ChangeNotifierProvider(
          create: (BuildContext context) => MovieProvider()),
      //+++
    ],
      child: MaterialApp(
        title: 'Provider Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

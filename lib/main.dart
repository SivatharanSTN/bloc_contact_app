import 'package:contactapp/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'homepage.dart';

void main() {
  runApp(
      MultiBlocProvider(providers: Providers.providers, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff4478F4),
      ),
      home: HomePage(),
      // home: const ContactForm(),
      // home: const ContactDetail(),
    );
  }
}

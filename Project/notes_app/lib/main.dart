import 'package:flutter/material.dart';
import 'package:notes_app/providers/notes/notes_provider.dart';
import 'package:notes_app/screens/add_note/add_note_screen.dart';
import 'package:notes_app/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        darkTheme: ThemeData(
          brightness: Brightness.dark,

          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigo, width: 2.0)
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0)
            ),
            floatingLabelStyle: TextStyle(color: Colors.indigo),
            labelStyle: TextStyle(color: Colors.indigo),
          )
        ),
        routes: {
          '/': (context) => HomeScreen(),
          '/addNote': (context) => AddNoteScreen(),
        },
      )
    );
  }
}

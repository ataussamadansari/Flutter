import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes_app/providers/notes/notes_provider.dart';
import 'package:provider/provider.dart';
import 'package:notes_app/models/note.dart';

class HomeScreen extends StatefulWidget
{
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text("Notes App"),
                centerTitle: true
            ),
            body: Consumer<NotesProvider>(
                builder: (context, provider, child)
                {
                    return provider.notes.isEmpty? Center(child: SvgPicture.asset(width: 200, height: 200, 'assets/svgs/note-list.svg')) : ListView(
                        padding: EdgeInsets.only(bottom: 100.0),
                        children: [
                            for (Note note in provider.notes)
                                ListTile(
                                    leading: Icon(CupertinoIcons.book),
                                    title: Text(note.title),
                                    subtitle: Text(note.description),
                                    trailing: IconButton(
                                        onPressed: () {
                                            provider.deleteNote(note);
                                        },
                                        icon: Icon(CupertinoIcons.delete)),
                                )
                        ]
                    );
                }
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addNote');
                },
                child: Icon(Icons.add)
            )
        );
    }
}

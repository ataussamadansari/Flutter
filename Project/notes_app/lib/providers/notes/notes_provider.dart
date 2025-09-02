import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';

class NotesProvider with ChangeNotifier {

  List<Note> notes = [];

  void addNote(Note note) {
    notes.add(note);
    notifyListeners();
  }
  
  void deleteNote(Note note) {
    notes.remove(note);
    notifyListeners();
  }

  void editNote(Note note, String title, String description) {
    note.title = title;
    note.description = description;
    notifyListeners();
  }
}
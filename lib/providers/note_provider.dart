import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/note.dart';

class NoteProvider with ChangeNotifier {
  List<Note> _notes = [];
  List<Note> _filteredNotes = [];
  final String _boxName = 'notes';

  List<Note> get notes => _filteredNotes;

  NoteProvider() {
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final box = await Hive.openBox<Note>(_boxName);
    _notes = box.values.toList();
    _filteredNotes = _notes;
    notifyListeners();
  }

  Future<void> addNote(Note note) async {
    final box = await Hive.openBox<Note>(_boxName);
    await box.add(note);
    _notes = box.values.toList();
    _filteredNotes = _notes;
    notifyListeners();
  }

  Future<void> updateNote(int index, Note note) async {
    final box = await Hive.openBox<Note>(_boxName);
    await box.putAt(index, note);
    _notes = box.values.toList();
    _filteredNotes = _notes;
    notifyListeners();
  }

  Future<void> deleteNote(int index) async {
    final box = await Hive.openBox<Note>(_boxName);
    await box.deleteAt(index);
    _notes = box.values.toList();
    _filteredNotes = _notes;
    notifyListeners();
  }

  void searchNotes(String query) {
    if (query.isEmpty) {
      _filteredNotes = _notes;
    } else {
      _filteredNotes = _notes.where((note) {
        return note.title.toLowerCase().contains(query.toLowerCase()) ||
            note.content.toLowerCase().contains(query.toLowerCase()) ||
            note.timestamp.toString().contains(query);
      }).toList();
    }
    notifyListeners();
  }
}
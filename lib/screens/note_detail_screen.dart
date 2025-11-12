import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';
import '../providers/note_provider.dart';

class NoteDetailScreen extends StatelessWidget {
  final Note note;
  final int index;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  NoteDetailScreen({required this.note, required this.index}) {
    _titleController.text = note.title;
    _contentController.text = note.content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Note'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              context.read<NoteProvider>().deleteNote(index);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Content'),
              maxLines: 5,
            ),
            SizedBox(height: 10),
            Text('Created: ${DateFormat.yMd().format(note.timestamp)}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedNote = Note(
                  title: _titleController.text,
                  content: _contentController.text,
                  timestamp: note.timestamp,
                );
                context.read<NoteProvider>().updateNote(index, updatedNote);
                Navigator.pop(context);
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
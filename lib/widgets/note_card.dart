import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/note.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final int index;
  final VoidCallback onTap;

  NoteCard({required this.note, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        title: Text(note.title),
        subtitle: Text(
          '${DateFormat.yMd().format(note.timestamp)} - ${note.content.substring(0, note.content.length > 50 ? 50 : note.content.length)}...',
        ),
        onTap: onTap,
      ),
    );
  }
}
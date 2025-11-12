import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';
import '../providers/note_provider.dart';
import '../services/speech_service.dart';
import '../widgets/note_card.dart';
import 'note_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final SpeechService _speechService = SpeechService();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voice Notes'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search notes...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                context.read<NoteProvider>().searchNotes(value);
              },
            ),
          ),
          Expanded(
            child: Consumer<NoteProvider>(
              builder: (context, provider, child) {
                return ListView.builder(
                  itemCount: provider.notes.length,
                  itemBuilder: (context, index) {
                    return NoteCard(
                      note: provider.notes[index],
                      index: index,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NoteDetailScreen(
                              note: provider.notes[index],
                              index: index,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _speechService.initialize();
          showDialog(
            context: context,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    title: Text('Record Voice Note'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(_speechService.isListening
                            ? 'Listening...'
                            : 'Press mic to record'),
                        SizedBox(height: 10),
                        Text(_speechService.text),
                      ],
                    ),
                    actions: [
                      IconButton(
                        icon: Icon(
                          _speechService.isListening
                              ? Icons.mic
                              : Icons.mic_none,
                          color: _speechService.isListening ? Colors.red : null,
                        ),
                        onPressed: () {
                          if (_speechService.isListening) {
                            _speechService.stopListening();
                          } else {
                            _speechService.startListening();
                          }
                          setState(() {});
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          if (_speechService.text.isNotEmpty) {
                            final note = Note(
                              title: 'Note ${DateFormat.yMd().format(DateTime.now())}',
                              content: _speechService.text,
                              timestamp: DateTime.now(),
                            );
                            context.read<NoteProvider>().addNote(note);
                          }
                          Navigator.pop(context);
                        },
                        child: Text('Save'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
        child: Icon(Icons.mic),
      ),
    );
  }
}
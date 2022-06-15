import 'package:esgi_flutter/data/models/note.dart';
import 'package:esgi_flutter/data/providers/note_cache_provider.dart';

class NoteRepository {
  final NoteCacheProvider _cache = NoteCacheProvider();

  addNote(Note note) async {
    await _cache.insert(note);
  }

  Future<List<Note>> getAllNotes() async {
    return await _cache.getAll();
  }
}

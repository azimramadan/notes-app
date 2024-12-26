import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:test4/constants.dart';
import 'package:test4/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel> notesList = [];
  fetchNotes() {
    var noteBox = Hive.box<NoteModel>(kNotesBox);
    notesList = noteBox.values.toList();
    emit(NotesSuccess());
  }
}

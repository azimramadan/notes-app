import 'package:flutter/material.dart';
import 'package:test4/models/note_model.dart';
import 'package:test4/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 36,
          left: 24,
          right: 24,
          bottom: 18,
        ),
        child: EditNoteViewBody(
          note: note,
        ),
      ),
    );
  }
}

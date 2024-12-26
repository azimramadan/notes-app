import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:test4/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:test4/cubits/notes_cubit/notes_cubit.dart';
import 'package:test4/widgets/note_view_body.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchNotes();
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
          if (state is AddNoteFailure) {}
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 36,
                left: 24,
                right: 24,
                bottom: 18,
              ),
              child: NoteViewBody(),
            ),
          );
        },
      ),
    );
  }
}

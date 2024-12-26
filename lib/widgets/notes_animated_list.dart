import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test4/cubits/notes_cubit/notes_cubit.dart';
import 'package:test4/models/note_model.dart';
import 'package:test4/widgets/confirm_discard_dialog.dart';
import 'package:test4/widgets/note_item.dart';

class NotesAnimatedList extends StatefulWidget {
  const NotesAnimatedList({
    super.key,
  });

  @override
  State<NotesAnimatedList> createState() => _NotesAnimatedListState();
}

class _NotesAnimatedListState extends State<NotesAnimatedList> {
  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  late List<NoteModel> notes = [];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotesCubit>(context).fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        final newNotes = BlocProvider.of<NotesCubit>(context).notesList;
        if (newNotes.length > notes.length) {
          notes.insert(0, newNotes.last);
          listKey.currentState?.insertItem(
            0,
            duration: Duration(milliseconds: 600),
          );
        }
        if (notes.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/rafiki.png'),
              Text(
                'Create your first note !',
              ),
            ],
          );
        }

        return AnimatedList(
          key: listKey,
          initialItemCount: notes.length,
          itemBuilder: (context, index, animation) {
            return NoteItemWidget(
              noteModel: notes[index],
              onClickedDelet: () {
                _showMyDialog(index);
              },
              animation: animation,
            );
          },
        );
      },
    );
  }

  void removeNote(int index) {
    final removedNote = notes[index];
    notes[index].delete();
    BlocProvider.of<NotesCubit>(context).fetchNotes();
    notes.removeAt(index);
    listKey.currentState!.removeItem(
      index,
      (context, animation) => NoteItemWidget(
        noteModel: removedNote,
        onClickedDelet: () {},
        animation: animation,
      ),
      duration: Duration(milliseconds: 600),
    );
  }

  Future<void> _showMyDialog(index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ConfirmDiscardDialog(
          textButton1: 'Delete',
          textButton2: 'Cancel',
          text: ' to delete the note?',
          onPressedDiscard: () {
            removeNote(index);
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          onPressedSave: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }
}

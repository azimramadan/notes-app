import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test4/cubits/notes_cubit/notes_cubit.dart';
import 'package:test4/models/note_model.dart';
import 'package:test4/widgets/custom_app_bar_widget.dart';
import 'package:test4/widgets/note_item_suggestion.dart';
import 'package:test4/widgets/notes_animated_list.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 36, left: 24, right: 24, bottom: 18),
      child: Column(
        children: [
          CustomAppBarWidget(
            click: () {
              showSearch(context: context, delegate: CustomSearchDelgate());
            },
            icon: Icons.search,
            widget: Text(
              'Notes',
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Expanded(
            child: NotesAnimatedList(),
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelgate extends SearchDelegate {
  late List<NoteModel> filterList;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return filterList.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/cuate.png'),
                Text('File not found. Try searching again.'),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24,
              top: 16,
              bottom: 16,
            ),
            child: ListView.builder(
              itemCount: filterList.length,
              itemBuilder: (context, index) {
                return NoteItemSuggestionWidget(
                  noteModel: filterList[index],
                );
              },
            ),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var notesLList = BlocProvider.of<NotesCubit>(context).notesList;
    notesLList = notesLList.reversed.toList();
    filterList = notesLList.where((note) {
      return note.title.contains(query) ||
          note.contant.contains(query) ||
          note.date.contains(query);
    }).toList();
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24,
        top: 16,
        bottom: 16,
      ),
      child: ListView.builder(
        itemCount: filterList.length,
        itemBuilder: (context, index) {
          return NoteItemSuggestionWidget(
            noteModel: filterList[index],
          );
        },
      ),
    );
  }
}

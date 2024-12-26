import 'package:flutter/material.dart';
import 'package:test4/models/note_model.dart';
import 'package:test4/views/edit_note_view.dart';

class NoteItemSuggestionWidget extends StatelessWidget {
  const NoteItemSuggestionWidget({
    super.key,
    required this.noteModel,
  });
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView(
                note: noteModel,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(noteModel.color),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  noteModel.title,
                  style: const TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(right: 26.0),
                child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  noteModel.contant,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.3),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 16),
              child: Text(
                noteModel.date,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(.3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Flexible(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 12.0),
//                     child: Text(
//                       title,
                      // style: const TextStyle(
                      //   fontSize: 28,
                      //   fontWeight: FontWeight.w400,
                      //   color: Colors.black,
                      // ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 24.0),
//                     child: Text(
//                       content,
//                       softWrap: true,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w300,
//                           color: Colors.grey),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 16.0),
                  // child: IconButton(
                  //   iconSize: 30,
                  //   color: Colors.black,
                  //   onPressed: clickToDelete,
                  //   icon: const Icon(
                  //     Icons.delete,
                  //   ),
                  // ),
//                 ),
//                 const SizedBox(
//                   height: 60,
//                 ),
//                 Text(
//                   date,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w300,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         )
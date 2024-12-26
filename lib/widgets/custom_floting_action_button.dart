import 'package:flutter/material.dart';
import 'package:test4/constants.dart';
import 'package:test4/views/note_view.dart';

class CustomFlotingActionButton extends StatelessWidget {
  const CustomFlotingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      backgroundColor: kPrimaryColor,
      child: const Icon(
        Icons.add,
        color: Colors.black,
        size: 30,
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return NoteView();
          },
        ));
      },
    );
  }
}

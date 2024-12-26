import 'package:flutter/material.dart';
import 'package:test4/widgets/custom_floting_action_button.dart';
import 'package:test4/widgets/notes_view_body.dart';

class NotesHomeView extends StatelessWidget {
  const NotesHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: NotesViewBody(),
      floatingActionButton: CustomFlotingActionButton(),
    );
  }
}

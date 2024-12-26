import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test4/constants.dart';
import 'package:test4/cubits/notes_cubit/notes_cubit.dart';
import 'package:test4/models/note_model.dart';
import 'package:test4/widgets/confirm_discard_dialog.dart';
import 'package:test4/widgets/custtom_text_form_field.dart';
import 'package:test4/widgets/note_app_bar.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({
    super.key,
    required this.note,
  });
  final NoteModel note;
  @override
  State<EditNoteViewBody> createState() => _NoteViewBodyState();
}

class _NoteViewBodyState extends State<EditNoteViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  late TextEditingController _controller1, _controller2;

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController(text: widget.note.title);
    _controller2 =
        TextEditingController(text: widget.note.contant); // النص الافتراضي
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          NoteAppBar(
            clickOnCheck: () {
              formKey.currentState!.save();
              if (content == widget.note.contant &&
                  title == widget.note.title) {
                Navigator.pop(context);
              } else if ((title?.isNotEmpty ?? false) ||
                  (content?.isNotEmpty ?? false)) {
                widget.note.title = title ?? '';
                widget.note.contant = content ?? '';
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchNotes();
                Navigator.pop(context);
              } else if ((title?.isEmpty ?? true) &&
                  (content?.isEmpty ?? true)) {
                if (formKey.currentState!.validate()) {
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              }
            },
            clickOnBack: () {
              formKey.currentState!.save();
              if (content == widget.note.contant &&
                  title == widget.note.title) {
                Navigator.pop(context);
              } else if ((title?.isNotEmpty ?? false) ||
                  (content?.isNotEmpty ?? false)) {
                _showMyDialog();
              } else if ((title?.isEmpty ?? true) &&
                  (content?.isEmpty ?? true)) {
                Navigator.pop(context);
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          CusttomTextFormField(
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'field is required!';
              }
              return null;
            },
            onSaved: (Value) {
              title = Value;
            },
            controller: _controller1,
            hintText: 'Title',
          ),
          Expanded(
            child: CusttomTextFormField(
              onSaved: (Value) {
                content = Value;
              },
              controller: _controller2,
              hintText: 'Type something...',
            ),
          ),
          ListOfColorInEditNote(
            noteModel: widget.note,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ConfirmDiscardDialog(
          onPressedDiscard: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          onPressedSave: () {
            widget.note.title = title ?? '';
            widget.note.contant = content ?? '';
            widget.note.save();
            BlocProvider.of<NotesCubit>(context).fetchNotes();
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        );
      },
    );
  }
}

class ListOfColorInEditNote extends StatefulWidget {
  const ListOfColorInEditNote({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  State<ListOfColorInEditNote> createState() => _ListOfColorState();
}

class _ListOfColorState extends State<ListOfColorInEditNote> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.noteModel.color));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              widget.noteModel.color = kColors[index].value;
              BlocProvider.of<NotesCubit>(context).fetchNotes();
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.5),
              child: CircleAvatar(
                backgroundColor: kColors[index],
                radius: 34,
                child: currentIndex == index ? Icon(Icons.check) : Text(''),
              ),
            ),
          );
        },
      ),
    );
  }
}

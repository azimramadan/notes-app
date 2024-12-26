import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test4/constants.dart';
import 'package:test4/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:test4/models/note_model.dart';
import 'package:test4/widgets/confirm_discard_dialog.dart';
import 'package:test4/widgets/custtom_text_form_field.dart';
import 'package:test4/widgets/note_app_bar.dart';

class NoteViewBody extends StatefulWidget {
  const NoteViewBody({
    super.key,
  });

  @override
  State<NoteViewBody> createState() => _NoteViewBodyState();
}

class _NoteViewBodyState extends State<NoteViewBody> {
  GlobalKey<FormState> forKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  late FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: forKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          NoteAppBar(
            clickOnCheck: () {
              forKey.currentState!.save();
              if (!(content?.isEmpty ?? true)) {
                BlocProvider.of<AddNoteCubit>(context).addNote(
                  NoteModel(
                    color: kPrimaryColor.value,
                    contant: content!,
                    date: DateFormat().add_yMEd().format(DateTime.now()),
                    title: title!,
                  ),
                );
              } else if (forKey.currentState!.validate()) {
                forKey.currentState!.save();
                BlocProvider.of<AddNoteCubit>(context).addNote(
                  NoteModel(
                    color: kPrimaryColor.value,
                    contant: content!,
                    date: DateFormat().add_yMEd().format(DateTime.now()),
                    title: title!,
                  ),
                );
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
            clickOnBack: () {
              forKey.currentState!.save();
              if ((title?.isNotEmpty ?? false) ||
                  (content?.isNotEmpty ?? false)) {
                _showMyDialog();
              } else {
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
            onSaved: (value) {
              title = value;
            },
            hintText: 'Title',
          ),
          Expanded(
            child: CusttomTextFormField(
              focusNode: _focusNode,
              onSaved: (value) {
                content = value;
              },
              hintText: 'Type something...',
            ),
          ),
          ListOfColor(),
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
            forKey.currentState!.save();
            BlocProvider.of<AddNoteCubit>(context).addNote(
              NoteModel(
                color: kPrimaryColor.value,
                contant: content!,
                date: DateFormat().add_yMEd().format(DateTime.now()),
                title: title!,
              ),
            );
          },
        );
      },
    );
  }
}

class ListOfColor extends StatefulWidget {
  const ListOfColor({super.key});

  @override
  State<ListOfColor> createState() => _ListOfColorState();
}

class _ListOfColorState extends State<ListOfColor> {
  int currentIndex = -1;
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
              BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
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

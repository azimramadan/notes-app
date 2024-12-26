import 'package:flutter/material.dart';
import 'package:test4/widgets/custom_text_button.dart';

class ConfirmDiscardDialog extends StatelessWidget {
  const ConfirmDiscardDialog({
    super.key,
    this.onPressedDiscard,
    this.onPressedSave,
    this.text,
    this.textButton1,
    this.textButton2,
  });
  final void Function()? onPressedDiscard;
  final String? text, textButton1, textButton2;
  final void Function()? onPressedSave;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[800],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.info, color: Colors.grey),
          SizedBox(height: 25),
          Text(
            'Are your sure you want',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            text ?? ' discard your changes ?',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      actions: [
        Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomTextButton(
              onPressed: onPressedDiscard,
              text: textButton1 ?? 'Discard',
            ),
            CustomTextButton(
              onPressed: onPressedSave,
              text: textButton2 ?? 'Save',
            ),
          ],
        ),
      ],
    );
  }
}

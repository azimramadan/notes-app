import 'package:flutter/material.dart';
import 'package:test4/constants.dart';

class CusttomTextFormField extends StatelessWidget {
  const CusttomTextFormField(
      {super.key,
      this.onSaved,
      required this.hintText,
      this.validator,
      this.focusNode,
      this.controller});
  final Function(String?)? onSaved;
  final String hintText;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      onSaved: onSaved,
      expands: hintText == 'Title' ? false : true,
      maxLines: hintText == 'Title' ? 1 : null,
      cursorColor: kPrimaryColor,
      style: TextStyle(
          fontSize: hintText == 'Title' ? 26 : 18, color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.grey, fontSize: hintText == 'Title' ? 36 : 16),
        border: InputBorder.none,
      ),
    );
  }
}

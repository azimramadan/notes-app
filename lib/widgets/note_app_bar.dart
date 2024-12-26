import 'package:flutter/material.dart';
import 'package:test4/widgets/custom_app_bar_widget.dart';
import 'package:test4/widgets/custom_icon_button.dart';

class NoteAppBar extends StatelessWidget {
  const NoteAppBar({
    super.key,
    required this.clickOnCheck,
    required this.clickOnBack,
  });
  final void Function() clickOnCheck;
  final void Function() clickOnBack;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: CustomAppBarWidget(
        click: clickOnCheck,
        icon: Icons.check,
        widget: CustomIconButton(
          click: clickOnBack,
          icon: Icons.arrow_back,
        ),
      ),
    );
  }
}

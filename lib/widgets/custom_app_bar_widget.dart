import 'package:flutter/material.dart';
import 'package:test4/widgets/custom_icon_button.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({
    super.key,
    required this.click,
    required this.icon,
    required this.widget,
  });
  final void Function() click;
  final IconData icon;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget,
          CustomIconButton(
            click: click,
            icon: icon,
          ),
        ],
      ),
    );
  }
}

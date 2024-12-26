import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.click,
    required this.icon,
  });
  final void Function() click;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30,
      onPressed: click,
      icon: Icon(icon),
      style: IconButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // تحديد الحواف
        ),
      ),
    );
  }
}

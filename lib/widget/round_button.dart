import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({super.key, required this.icon, required this.onClick});
  final VoidCallback onClick;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onClick,
      elevation: 0,
      backgroundColor: Colors.blueGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50)
      ),
      child: Icon(icon,color: Colors.white),
    );
  }
}

import 'package:flutter/material.dart';

class Textfieldwidget extends StatelessWidget {
  const Textfieldwidget({
    super.key,
    required this.nameController,
    required this.hintText,
    required this.errorText,
  });

  final TextEditingController nameController;
  final String hintText;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        controller: nameController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
          errorText: errorText,
        ),
      ),
    );
  }
}

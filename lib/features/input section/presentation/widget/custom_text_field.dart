import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController _titleController;  
  final String? hintText;
  final int maxline;

  const CustomTextField({
    Key? key,
    required TextEditingController titleController,
    required this.hintText, 
    this.maxline = 1, 
  }) : _titleController = titleController, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20
      ),
      child: TextField(
        controller: _titleController,
        maxLines: maxline,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}
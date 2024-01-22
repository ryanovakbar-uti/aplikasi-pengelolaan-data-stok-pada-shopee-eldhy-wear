import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    super.key,
    required this.myController,
    required this.myReadOnly,
    required this.myLabelText,
    required this.myObscureText,
  });

  final TextEditingController myController;
  final bool myReadOnly;
  final String myLabelText;
  final bool myObscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      readOnly: myReadOnly,
      autocorrect: false,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: myLabelText,
        labelStyle: TextStyle(color: Colors.grey.shade600),
        filled: true,
        fillColor: Colors.grey.shade300,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.amber, width: 2.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.amber, width: 2.0),
        ),
      ),
      obscureText: myObscureText,
    );
  }
}
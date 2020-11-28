import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final Function onClick;

  CustomTextField({this.hint, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        onSaved: onClick,
        obscureText: hint == 'Enter Your Password' ? true : false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

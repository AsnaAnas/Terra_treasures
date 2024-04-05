import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextfield({super.key
  ,required this.controller,
  required this.hintText,
  required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return   Padding(
              padding: const EdgeInsets.only(left: 100,right: 100),
              child: TextField(
                cursorHeight: 20,
                controller: controller,
                obscureText: obscureText,
                decoration: InputDecoration(
                  enabledBorder:  OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                     borderRadius: BorderRadius.circular(17),
                   ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: hintText,
                ),
              ),
            );
  }
}
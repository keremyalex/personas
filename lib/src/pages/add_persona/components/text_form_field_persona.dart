import 'package:flutter/material.dart';

class TextFormFieldPersona extends StatelessWidget {
  final String titulo, hintText;
  final Icon icono;
  final TextEditingController controller;

  const TextFormFieldPersona({
    Key key,
    this.titulo,
    this.hintText,
    this.icono,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: controller,
        //textAlign: TextAlign.center,
        decoration: InputDecoration(
            labelText: titulo,
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            border: InputBorder.none,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: icono,
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}

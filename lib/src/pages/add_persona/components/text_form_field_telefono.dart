import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldTelefono extends StatelessWidget {
  final String titulo, hintText;
  final Icon icono;
  final TextEditingController controller;

  const TextFormFieldTelefono({
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
        keyboardType: TextInputType.number,
        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
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

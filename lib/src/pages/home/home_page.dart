import 'package:flutter/material.dart';
import 'package:persona/src/bloc/personas_bloc.dart';
import 'package:persona/src/pages/home/components/body.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final personasBloc = new PersonasBloc();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Lista de Personas',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 1,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.red[800],
                ),
                onPressed: personasBloc.borrarPersonaTodos)
          ],
        ),
        body: Body(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent[700],
          onPressed: () => Navigator.pushNamed(context, 'AddPersonaPage'),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

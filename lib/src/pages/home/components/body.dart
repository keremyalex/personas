import 'package:flutter/material.dart';
import 'package:persona/src/bloc/personas_bloc.dart';
import 'package:persona/src/models/persona_model.dart';

class Body extends StatelessWidget {
  final personasBloc = new PersonasBloc();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: personasBloc.personasStream,
        builder:
            (BuildContext context, AsyncSnapshot<List<PersonaModel>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final personas = snapshot.data;

          if (personas.length == 0) {
            return Center(
              child: Text('No hay información'),
            );
          }
          return ListView.builder(
              itemCount: personas.length,
              itemBuilder: (context, i) => Dismissible(
                    key: UniqueKey(),
                    background: Container(color: Colors.red),
                    onDismissed: (direction) =>
                        personasBloc.borrarPersona(personas[i].id),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            Colors.primaries[i % Colors.primaries.length],
                        child: Text(
                          '${i + 1}',
                          style: TextStyle(color: Colors.white),
                        ), //${personas[i].id}
                      ),
                      title: Text(
                        personas[i].nombre,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          '${personas[i].direccion} \n${personas[i].telefono}'),
                      trailing: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ));
        });
  }
}

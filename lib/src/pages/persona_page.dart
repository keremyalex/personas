import 'package:flutter/material.dart';
import 'package:persona/src/bloc/personas_bloc.dart';
import 'package:persona/src/models/persona_model.dart';

class PersonaPage extends StatelessWidget {
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
                        child: Text('${i + 1}'), //${personas[i].id}
                      ),
                      title: Text(personas[i].nombre),
                      subtitle: Text(
                          'ID: ${personas[i].id} \n${personas[i].direccion} \n${personas[i].telefono}'),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey,
                      ),
                    ),
                  ));
        });
  }
}

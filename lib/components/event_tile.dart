import 'package:flutter/material.dart';
import 'package:flutter_crud/models/event.dart';
import 'package:flutter_crud/provider/events.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class EventTile extends StatelessWidget {
  final Event event;

  const EventTile(this.event);

  @override
  Widget build(BuildContext context) {
    final avatar = Icon(Icons.event);
    return ListTile(
      leading: avatar,
      title: Text(event.name),
      subtitle: Text(event.date),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.EVENT_FORM,
                  arguments: event,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Excluir evento'),
                    content: Text('Tem certeza???'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Não'),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      FlatButton(
                        child: Text('Sim'),
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                    ],
                  ),
                ).then((confimed) {
                  if (confimed) {
                    Provider.of<Events>(context, listen: false).remove(event);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

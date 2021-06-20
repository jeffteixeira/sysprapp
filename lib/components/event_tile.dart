import 'package:flutter/material.dart';
import 'package:sysprapp/models/event.dart';
import 'package:sysprapp/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:sysprapp/provider/events.dart';

class EventTile extends StatelessWidget {
  final Event event;
  const EventTile(this.event);

  @override
  Widget build(BuildContext context) {
    final avatar = CircleAvatar(
      child: Icon(Icons.event_available),
    );
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
              color: Colors.green,
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
                Provider.of<Events>(context, listen: false).remove(event);
              },
            ),
          ],
        ),
      ),
    );
  }
}

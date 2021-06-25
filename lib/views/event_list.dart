import 'package:flutter/material.dart';
import 'package:sysprapp/components/event_tile.dart';
import 'package:sysprapp/provider/events.dart';
import 'package:sysprapp/routes/app_routes.dart';
import 'package:provider/provider.dart';

class EventList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Events users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Eventos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.EVENT_FORM);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => EventTile(users.byIndex(i)),
      ),
    );
  }
}

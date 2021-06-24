import 'package:flutter/material.dart';
import 'package:flutter_crud/provider/events.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:flutter_crud/views/event_form.dart';
import 'package:flutter_crud/views/event_list.dart';
import 'package:flutter_crud/views/login_page.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Events(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.HOME: (_) => LoginPage(),
          AppRoutes.EVENT_LIST: (_) => EventList(),
          AppRoutes.EVENT_FORM: (_) => EventForm(),
        },
      ),
    );
  }
}

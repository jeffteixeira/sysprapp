import 'package:flutter/material.dart';
import 'package:sysprapp/provider/events.dart';
import 'package:sysprapp/routes/app_routes.dart';
import 'package:sysprapp/views/event_form.dart';
import 'package:sysprapp/views/event_list.dart';
import 'package:sysprapp/views/login_page.dart';

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

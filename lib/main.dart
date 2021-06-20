import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sysprapp/provider/events.dart';
import 'package:sysprapp/routes/app_routes.dart';
import 'package:sysprapp/views/event_form.dart';
import 'package:sysprapp/views/event_list.dart';
import 'package:sysprapp/views/login.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => new Events(),
        ),
      ],
      child: MaterialApp(
        title: 'SysprApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.HOME: (_) => LoginPage(),
          AppRoutes.LIST_EVENT: (_) => EventList(),
          AppRoutes.EVENT_FORM: (_) => EventForm(),
        },
      ),
    );
  }
}

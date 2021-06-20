import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sysprapp/data/dummy_events.dart';
import 'package:sysprapp/models/event.dart';

class Events with ChangeNotifier {
  final Map<String, Event> _items = {...DUMMY_EVENTS};

  List<Event> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Event byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Event event) {
    if (event == null) {
      return;
    }

    if (event.id != null &&
        event.id.trim().isNotEmpty &&
        _items.containsKey(event.id)) {
      _items.update(
        event.id,
        (_) => Event(
          name: event.name,
          date: event.date,
          spending: event.spending,
          donations: event.donations,
        ),
      );
    } else {
      //Adicionar
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Event(
          id: id,
          name: event.name,
          date: event.date,
          spending: event.spending,
          donations: event.donations,
        ),
      );
    }

    notifyListeners();
  }

  void remove(Event event) {
    if (event != null && event.id != null) {
      _items.remove(event.id);
      notifyListeners();
    }
  }
}

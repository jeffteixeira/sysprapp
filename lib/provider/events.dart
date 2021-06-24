import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_events.dart';
import 'package:flutter_crud/models/event.dart';

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
          id: event.id,
          name: event.name,
          date: event.date,
          spending: event.spending,
          donation: event.donation,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Event(
          id: id,
          name: event.name,
          date: event.date,
          spending: event.spending,
          donation: event.donation,
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
